package com.miui.gallery.editor.photo.app;

import android.app.Activity;
import android.app.Dialog;
import android.app.LoaderManager.LoaderCallbacks;
import android.app.ProgressDialog;
import android.content.AsyncTaskLoader;
import android.content.Context;
import android.content.Intent;
import android.content.Loader;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.Bundle;
import android.support.media.ExifInterface;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;
import com.edmodo.cropper.CropImageView;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.GalleryDialogFragment;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;

public class CropperActivity extends BaseActivity {
    private LoaderCallbacks<DecodeResult> mCallbacks = new LoaderCallbacks<DecodeResult>() {
        /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v1, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context]
  assigns: [com.miui.gallery.editor.photo.app.CropperActivity]
  uses: [android.content.Context]
  mth insns count: 5
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader<DecodeResult> onCreateLoader(int i, Bundle bundle) {
            return new PrepareLoader(CropperActivity.this, CropperActivity.this.mData);
        }

        /* JADX WARNING: type inference failed for: r2v3, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v3, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context]
  assigns: [com.miui.gallery.editor.photo.app.CropperActivity]
  uses: [android.content.Context]
  mth insns count: 21
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onLoadFinished(Loader loader, DecodeResult decodeResult) {
            if (decodeResult.mBitmap != null) {
                CropperActivity.this.mCropView.setImageBitmap(decodeResult.mBitmap);
                CropperActivity.this.mSaveButton.setEnabled(true);
                return;
            }
            if (decodeResult.mException != null) {
                Log.w("CropperActivity", (Throwable) decodeResult.mException);
            }
            Toast.makeText(CropperActivity.this, R.string.image_decode_failed, 0).show();
            CropperActivity.this.finish();
        }

        public void onLoaderReset(Loader loader) {
        }
    };
    /* access modifiers changed from: private */
    public View mCancelButton;
    /* access modifiers changed from: private */
    public CropImageView mCropView;
    /* access modifiers changed from: private */
    public Uri mData;
    private OnClickListener mOnClickListener = new OnClickListener() {
        public void onClick(View view) {
            if (view == CropperActivity.this.mCancelButton) {
                CropperActivity.this.finish();
            } else if (view == CropperActivity.this.mSaveButton) {
                new ExportFragment().showAllowingStateLoss(CropperActivity.this.getFragmentManager(), "ExportFragment");
            }
        }
    };
    /* access modifiers changed from: private */
    public Uri mOutput;
    private float mOutputX;
    private float mOutputY;
    private boolean mReturnData;
    /* access modifiers changed from: private */
    public View mSaveButton;

    private static class DecodeResult {
        Bitmap mBitmap;
        Exception mException;

        DecodeResult(Bitmap bitmap, Exception exc) {
            this.mBitmap = bitmap;
            this.mException = exc;
        }
    }

    public static class ExportFragment extends GalleryDialogFragment {
        private LoaderCallbacks<Boolean> mCallbacks = new LoaderCallbacks<Boolean>() {
            public Loader<Boolean> onCreateLoader(int i, Bundle bundle) {
                return new ExportLoader(ExportFragment.this.mCropper, ExportFragment.this.mCropper.mOutput);
            }

            /* JADX WARNING: type inference failed for: r2v5, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v5, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context]
  assigns: [com.miui.gallery.editor.photo.app.CropperActivity]
  uses: [android.content.Context]
  mth insns count: 14
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public void onLoadFinished(Loader loader, Boolean bool) {
                if (bool.booleanValue()) {
                    ExportFragment.this.mCropper.setResult(-1, new Intent());
                } else {
                    Toast.makeText(ExportFragment.this.mCropper, R.string.main_save_error_msg, 0).show();
                }
                ExportFragment.this.mCropper.finish();
            }

            public void onLoaderReset(Loader loader) {
            }
        };
        /* access modifiers changed from: private */
        public CropperActivity mCropper;

        public void onAttach(Activity activity) {
            super.onAttach(activity);
            if (activity instanceof CropperActivity) {
                this.mCropper = (CropperActivity) activity;
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("can't attach to install of ");
            sb.append(activity.getClass().getSimpleName());
            throw new IllegalStateException(sb.toString());
        }

        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            getLoaderManager().initLoader(0, null, this.mCallbacks);
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context]
  assigns: [com.miui.gallery.editor.photo.app.CropperActivity]
  uses: [android.content.Context]
  mth insns count: 8
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Dialog onCreateDialog(Bundle bundle) {
            ProgressDialog progressDialog = new ProgressDialog(this.mCropper);
            progressDialog.setCancelable(false);
            progressDialog.setCanceledOnTouchOutside(false);
            progressDialog.setMessage(getActivity().getString(R.string.photo_editor_saving));
            return progressDialog;
        }
    }

    private static class ExportLoader extends AsyncTaskLoader<Boolean> {
        private WeakReference<CropperActivity> mActivityWeakReference;
        private Uri mOut;
        private Boolean mResult;

        /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context, java.lang.Object] */
        /* JADX WARNING: Incorrect type for immutable var: ssa=com.miui.gallery.editor.photo.app.CropperActivity, code=null, for r1v0, types: [com.miui.gallery.editor.photo.app.CropperActivity, android.content.Context, java.lang.Object] */
        /* JADX WARNING: Unknown variable types count: 1 */
        public ExportLoader(CropperActivity r1, Uri uri) {
            super(r1);
            this.mOut = uri;
            this.mActivityWeakReference = new WeakReference<>(r1);
        }

        public void deliverResult(Boolean bool) {
            super.deliverResult(bool);
            this.mResult = bool;
            if (isStarted()) {
                super.deliverResult(bool);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:47:0x00ad A[SYNTHETIC, Splitter:B:47:0x00ad] */
        /* JADX WARNING: Removed duplicated region for block: B:54:0x00b9 A[SYNTHETIC, Splitter:B:54:0x00b9] */
        /* JADX WARNING: Removed duplicated region for block: B:61:0x00c5 A[SYNTHETIC, Splitter:B:61:0x00c5] */
        /* JADX WARNING: Removed duplicated region for block: B:70:0x00dd A[SYNTHETIC, Splitter:B:70:0x00dd] */
        public Boolean loadInBackground() {
            CompressFormat compressFormat;
            Log.d("CropperActivity", "start export in background.");
            CropperActivity cropperActivity = (CropperActivity) this.mActivityWeakReference.get();
            if (cropperActivity == null) {
                return Boolean.valueOf(false);
            }
            Bitmap access$400 = cropperActivity.createOutput();
            if (access$400 == null) {
                return Boolean.valueOf(false);
            }
            if ("file".equals(this.mOut.getScheme())) {
                compressFormat = GalleryUtils.convertExtensionToCompressFormat(FileUtils.getExtension(this.mOut.getPath()));
            } else {
                String type = getContext().getContentResolver().getType(this.mOut);
                compressFormat = "image/png".equals(type) ? CompressFormat.PNG : "image/webp".equals(type) ? CompressFormat.WEBP : CompressFormat.JPEG;
            }
            OutputStream outputStream = null;
            try {
                OutputStream openOutputStream = getContext().getContentResolver().openOutputStream(this.mOut);
                if (openOutputStream != null) {
                    BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(openOutputStream);
                    try {
                        Boolean valueOf = Boolean.valueOf(access$400.compress(compressFormat, 100, bufferedOutputStream));
                        try {
                            bufferedOutputStream.close();
                        } catch (IOException e) {
                            Log.w("CropperActivity", (Throwable) e);
                        } catch (Exception e2) {
                            Log.e("CropperActivity", (Throwable) e2);
                        }
                        return valueOf;
                    } catch (FileNotFoundException e3) {
                        e = e3;
                        outputStream = bufferedOutputStream;
                        Log.w("CropperActivity", (Throwable) e);
                        if (outputStream != null) {
                            outputStream.close();
                        }
                        return Boolean.valueOf(false);
                    } catch (SecurityException e4) {
                        e = e4;
                        outputStream = bufferedOutputStream;
                        Log.w("CropperActivity", (Throwable) e);
                        if (outputStream != null) {
                            outputStream.close();
                        }
                        return Boolean.valueOf(false);
                    } catch (Exception e5) {
                        e = e5;
                        outputStream = bufferedOutputStream;
                        try {
                            Log.e("CropperActivity", (Throwable) e);
                            if (outputStream != null) {
                                try {
                                    outputStream.close();
                                } catch (IOException e6) {
                                    Log.w("CropperActivity", (Throwable) e6);
                                } catch (Exception e7) {
                                    Log.e("CropperActivity", (Throwable) e7);
                                }
                            }
                            return Boolean.valueOf(false);
                        } catch (Throwable th) {
                            th = th;
                            if (outputStream != null) {
                                try {
                                    outputStream.close();
                                } catch (IOException e8) {
                                    Log.w("CropperActivity", (Throwable) e8);
                                } catch (Exception e9) {
                                    Log.e("CropperActivity", (Throwable) e9);
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        outputStream = bufferedOutputStream;
                        if (outputStream != null) {
                        }
                        throw th;
                    }
                }
            } catch (FileNotFoundException e10) {
                e = e10;
                Log.w("CropperActivity", (Throwable) e);
                if (outputStream != null) {
                }
                return Boolean.valueOf(false);
            } catch (SecurityException e11) {
                e = e11;
                Log.w("CropperActivity", (Throwable) e);
                if (outputStream != null) {
                }
                return Boolean.valueOf(false);
            } catch (Exception e12) {
                e = e12;
                Log.e("CropperActivity", (Throwable) e);
                if (outputStream != null) {
                }
                return Boolean.valueOf(false);
            }
            return Boolean.valueOf(false);
        }

        /* access modifiers changed from: protected */
        public void onReset() {
            super.onReset();
        }

        /* access modifiers changed from: protected */
        public void onStartLoading() {
            super.onStartLoading();
            if (this.mResult == null) {
                forceLoad();
            } else {
                deliverResult(this.mResult);
            }
        }
    }

    private static class PrepareLoader extends AsyncTaskLoader<DecodeResult> {
        private DecodeResult mDecodeResult;
        private Uri mUri;

        public PrepareLoader(Context context, Uri uri) {
            super(context);
            this.mUri = uri;
        }

        /* JADX WARNING: Removed duplicated region for block: B:29:0x004c A[SYNTHETIC, Splitter:B:29:0x004c] */
        /* JADX WARNING: Removed duplicated region for block: B:36:0x005a A[SYNTHETIC, Splitter:B:36:0x005a] */
        private int getPhotoRotation(Uri uri) {
            InputStream inputStream = null;
            try {
                InputStream openInputStream = getContext().getContentResolver().openInputStream(uri);
                if (openInputStream != null) {
                    try {
                        inputStream = new BufferedInputStream(openInputStream);
                        int rotationDegrees = ExifUtil.getRotationDegrees((ExifInterface) ExifUtil.sSupportExifCreator.create(inputStream));
                        try {
                            inputStream.close();
                        } catch (IOException e) {
                            Log.w("CropperActivity", (Throwable) e);
                        }
                        return rotationDegrees;
                    } catch (FileNotFoundException e2) {
                        Throwable th = e2;
                        inputStream = openInputStream;
                        e = th;
                        try {
                            Log.w("CropperActivity", e);
                            if (inputStream != null) {
                            }
                            return 0;
                        } catch (Throwable th2) {
                            th = th2;
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException e3) {
                                    Log.w("CropperActivity", (Throwable) e3);
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th3) {
                        Throwable th4 = th3;
                        inputStream = openInputStream;
                        th = th4;
                        if (inputStream != null) {
                        }
                        throw th;
                    }
                } else {
                    Log.e("CropperActivity", "no stream opened");
                    if (openInputStream != null) {
                        try {
                            openInputStream.close();
                        } catch (IOException e4) {
                            Log.w("CropperActivity", (Throwable) e4);
                        }
                    }
                    return 0;
                }
            } catch (FileNotFoundException e5) {
                e = e5;
                Log.w("CropperActivity", e);
                if (inputStream != null) {
                    inputStream.close();
                }
                return 0;
            }
        }

        private Bitmap rotateBitmap(int i, Bitmap bitmap) {
            Matrix matrix = new Matrix();
            matrix.preRotate((float) i);
            try {
                return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
            } catch (OutOfMemoryError unused) {
                Log.e("CropperActivity", "rotateBitmap OutOfMemoryError");
                return null;
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:30:0x005f A[SYNTHETIC, Splitter:B:30:0x005f] */
        /* JADX WARNING: Removed duplicated region for block: B:36:0x006c A[SYNTHETIC, Splitter:B:36:0x006c] */
        private int sampleSize(Uri uri) {
            InputStream inputStream;
            InputStream inputStream2 = null;
            try {
                InputStream openInputStream = getContext().getContentResolver().openInputStream(uri);
                if (openInputStream != null) {
                    try {
                        inputStream = new BufferedInputStream(openInputStream);
                        try {
                            Options options = new Options();
                            options.inJustDecodeBounds = true;
                            BitmapFactory.decodeStream(inputStream, null, options);
                            int max = Math.max(Math.round((float) (options.outHeight / 2048)), Math.round((float) (options.outWidth / 2048)));
                            try {
                                inputStream.close();
                            } catch (IOException e) {
                                Log.w("CropperActivity", (Throwable) e);
                            }
                            return max;
                        } catch (FileNotFoundException e2) {
                            e = e2;
                            inputStream2 = inputStream;
                            try {
                                Log.w("CropperActivity", e);
                                if (inputStream2 != null) {
                                }
                                return 1;
                            } catch (Throwable th) {
                                th = th;
                                inputStream = inputStream2;
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e3) {
                                        Log.w("CropperActivity", (Throwable) e3);
                                    }
                                }
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            if (inputStream != null) {
                            }
                            throw th;
                        }
                    } catch (FileNotFoundException e4) {
                        Throwable th3 = e4;
                        inputStream2 = openInputStream;
                        e = th3;
                        Log.w("CropperActivity", e);
                        if (inputStream2 != null) {
                        }
                        return 1;
                    } catch (Throwable th4) {
                        inputStream = openInputStream;
                        th = th4;
                        if (inputStream != null) {
                        }
                        throw th;
                    }
                } else {
                    if (openInputStream != null) {
                        try {
                            openInputStream.close();
                        } catch (IOException e5) {
                            Log.w("CropperActivity", (Throwable) e5);
                        }
                    }
                    return 1;
                }
            } catch (FileNotFoundException e6) {
                e = e6;
                Log.w("CropperActivity", e);
                if (inputStream2 != null) {
                    inputStream2.close();
                }
                return 1;
            }
        }

        public void deliverResult(DecodeResult decodeResult) {
            if (!isReset()) {
                this.mDecodeResult = decodeResult;
            }
            if (isStarted()) {
                super.deliverResult(decodeResult);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:41:0x009e A[SYNTHETIC, Splitter:B:41:0x009e] */
        /* JADX WARNING: Removed duplicated region for block: B:52:0x00b7 A[SYNTHETIC, Splitter:B:52:0x00b7] */
        /* JADX WARNING: Removed duplicated region for block: B:59:0x00c5 A[SYNTHETIC, Splitter:B:59:0x00c5] */
        public DecodeResult loadInBackground() {
            InputStream inputStream;
            try {
                InputStream openInputStream = getContext().getContentResolver().openInputStream(this.mUri);
                if (openInputStream != null) {
                    try {
                        inputStream = new BufferedInputStream(openInputStream);
                        try {
                            Options options = new Options();
                            options.inSampleSize = sampleSize(this.mUri);
                            Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
                            int photoRotation = getPhotoRotation(this.mUri);
                            if (photoRotation != 0) {
                                Log.d("CropperActivity", "rotate image by %d", (Object) Integer.valueOf(photoRotation));
                                decodeStream = rotateBitmap(photoRotation, decodeStream);
                            }
                            Log.d("CropperActivity", "sample size is %dx%d", Integer.valueOf(options.outWidth), Integer.valueOf(options.outHeight));
                            DecodeResult decodeResult = new DecodeResult(decodeStream, null);
                            try {
                                inputStream.close();
                            } catch (IOException e) {
                                Log.w("CropperActivity", (Throwable) e);
                            }
                            return decodeResult;
                        } catch (FileNotFoundException e2) {
                            e = e2;
                            Log.e("CropperActivity", (Throwable) e);
                            DecodeResult decodeResult2 = new DecodeResult(null, e);
                            if (inputStream != null) {
                            }
                            return decodeResult2;
                        } catch (SecurityException e3) {
                            e = e3;
                            try {
                                Log.w("CropperActivity", (Throwable) e);
                                DecodeResult decodeResult3 = new DecodeResult(null, e);
                                if (inputStream != null) {
                                }
                                return decodeResult3;
                            } catch (Throwable th) {
                                th = th;
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e4) {
                                        Log.w("CropperActivity", (Throwable) e4);
                                    }
                                }
                                throw th;
                            }
                        }
                    } catch (FileNotFoundException e5) {
                        Exception exc = e5;
                        inputStream = openInputStream;
                        e = exc;
                        Log.e("CropperActivity", (Throwable) e);
                        DecodeResult decodeResult22 = new DecodeResult(null, e);
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e6) {
                                Log.w("CropperActivity", (Throwable) e6);
                            }
                        }
                        return decodeResult22;
                    } catch (SecurityException e7) {
                        Exception exc2 = e7;
                        inputStream = openInputStream;
                        e = exc2;
                        Log.w("CropperActivity", (Throwable) e);
                        DecodeResult decodeResult32 = new DecodeResult(null, e);
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e8) {
                                Log.w("CropperActivity", (Throwable) e8);
                            }
                        }
                        return decodeResult32;
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream = openInputStream;
                        if (inputStream != null) {
                        }
                        throw th;
                    }
                } else {
                    Log.d("CropperActivity", "no stream return.");
                    DecodeResult decodeResult4 = new DecodeResult(null, null);
                    if (openInputStream != null) {
                        try {
                            openInputStream.close();
                        } catch (IOException e9) {
                            Log.w("CropperActivity", (Throwable) e9);
                        }
                    }
                    return decodeResult4;
                }
            } catch (FileNotFoundException e10) {
                e = e10;
                inputStream = null;
                Log.e("CropperActivity", (Throwable) e);
                DecodeResult decodeResult222 = new DecodeResult(null, e);
                if (inputStream != null) {
                }
                return decodeResult222;
            } catch (SecurityException e11) {
                e = e11;
                inputStream = null;
                Log.w("CropperActivity", (Throwable) e);
                DecodeResult decodeResult322 = new DecodeResult(null, e);
                if (inputStream != null) {
                }
                return decodeResult322;
            } catch (Throwable th3) {
                inputStream = null;
                th = th3;
                if (inputStream != null) {
                }
                throw th;
            }
        }

        /* access modifiers changed from: protected */
        public void onReset() {
            super.onReset();
            this.mDecodeResult = null;
        }

        /* access modifiers changed from: protected */
        public void onStartLoading() {
            super.onStartLoading();
            if (this.mDecodeResult == null) {
                forceLoad();
            } else {
                deliverResult(this.mDecodeResult);
            }
        }
    }

    /* access modifiers changed from: private */
    public Bitmap createOutput() {
        long currentTimeMillis = System.currentTimeMillis();
        Bitmap croppedImage = this.mCropView.getCroppedImage();
        if (this.mOutputX > 0.0f && this.mOutputY > 0.0f) {
            Matrix matrix = new Matrix();
            matrix.setScale(this.mOutputX / ((float) croppedImage.getWidth()), this.mOutputY / ((float) croppedImage.getHeight()));
            croppedImage = Bitmap.createBitmap(croppedImage, 0, 0, croppedImage.getWidth(), croppedImage.getHeight(), matrix, true);
        }
        Log.d("CropperActivity", "create output costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return croppedImage;
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.crop_activity);
        this.mSaveButton = findViewById(R.id.ok);
        this.mCancelButton = findViewById(R.id.cancel);
        this.mSaveButton.setOnClickListener(this.mOnClickListener);
        this.mCancelButton.setOnClickListener(this.mOnClickListener);
        this.mCropView = (CropImageView) findViewById(R.id.crop_view);
        this.mSaveButton.setEnabled(false);
        Intent intent = getIntent();
        this.mData = intent.getData();
        this.mOutput = (Uri) intent.getParcelableExtra("output");
        this.mReturnData = intent.getBooleanExtra("return-data", false);
        this.mOutputX = (float) intent.getIntExtra("outputX", -1);
        this.mOutputY = (float) intent.getIntExtra("outputY", -1);
        if (this.mData == null || this.mOutput == null) {
            Log.e("CropperActivity", "src or des missed, src: %s, des: %s", this.mData, this.mOutput);
            finish();
            return;
        }
        Log.d("CropperActivity", "cropper's input: %s, output: %s", this.mData, this.mOutput == null ? "bytes" : this.mOutput);
        int intExtra = intent.getIntExtra("aspectX", -1);
        int intExtra2 = intent.getIntExtra("aspectY", -1);
        if (intExtra > 0 && intExtra2 > 0) {
            this.mCropView.setFixedAspectRatio(intent.getBooleanExtra("fixed_aspect_ratio", true));
            this.mCropView.setAspectRatio(intExtra, intExtra2);
        }
        getLoaderManager().initLoader(0, null, this.mCallbacks);
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
    }
}
