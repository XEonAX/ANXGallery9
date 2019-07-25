package com.miui.gallery.picker;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.listener.SingleClickListener;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.picker.helper.Picker.ImageType;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.picker.helper.Picker.ResultType;
import com.miui.gallery.provider.GalleryOpenProvider;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import miui.app.ActionBar;
import miui.gallery.support.MiuiSdkCompat;

public abstract class PickerActivity extends PickerCompatActivity {
    protected static final String[] PICKABLE_PROJECTION = {"_id", "sha1", "microthumbfile", "thumbnailFile", "localFile", "serverType", "size", "exifImageLength", "exifImageWidth"};
    private Decor mDecor;
    /* access modifiers changed from: protected */
    public Picker mPicker;
    private CharSequence mPickerTitle;
    private CharSequence mTitle;

    public static abstract class Decor {
        protected PickerActivity mActivity;

        private static class Multiple extends Decor {
            /* access modifiers changed from: private */
            public Button mDoneButton;
            private TextView mTitle;

            protected Multiple(PickerActivity pickerActivity) {
                super(pickerActivity);
            }

            /* JADX WARNING: type inference failed for: r4v0, types: [android.content.Context, com.miui.gallery.picker.PickerActivity] */
            /* JADX WARNING: type inference failed for: r0v6, types: [android.content.Context, com.miui.gallery.picker.PickerActivity] */
            /* JADX WARNING: type inference failed for: r4v7, types: [android.content.Context, com.miui.gallery.picker.PickerActivity] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v0, types: [android.content.Context, com.miui.gallery.picker.PickerActivity]
  assigns: [com.miui.gallery.picker.PickerActivity]
  uses: [android.content.Context]
  mth insns count: 51
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
            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 3 */
            public void applyActionBar() {
                Log.d("PickerActivity", "applyActionBar");
                ActionBar actionBar = this.mActivity.getActionBar();
                boolean z = true;
                actionBar.setDisplayShowCustomEnabled(true);
                actionBar.setTabsMode(false);
                actionBar.setCustomView(R.layout.picker_custom_title);
                View customView = actionBar.getCustomView();
                this.mTitle = (TextView) customView.findViewById(16908310);
                if (BuildUtil.isInternational()) {
                    this.mTitle.setTextAppearance(this.mActivity, 2131820587);
                } else {
                    this.mTitle.setTypeface(Typeface.MONOSPACE);
                }
                Button button = (Button) customView.findViewById(16908313);
                MiuiSdkCompat.setEditActionModeButton(this.mActivity, button, 3);
                button.setOnClickListener(new OnClickListener() {
                    public void onClick(View view) {
                        Multiple.this.mActivity.mPicker.cancel();
                    }
                });
                this.mDoneButton = (Button) customView.findViewById(16908314);
                MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mDoneButton, 2);
                this.mDoneButton.setOnClickListener(new SingleClickListener() {
                    /* access modifiers changed from: protected */
                    public void onSingleClick(View view) {
                        Multiple.this.mActivity.mPicker.done();
                    }
                });
                Button button2 = this.mDoneButton;
                if (this.mActivity.mPicker.count() < this.mActivity.mPicker.baseline()) {
                    z = false;
                }
                button2.setEnabled(z);
                this.mActivity.mPicker.registerObserver(new DataSetObserver() {
                    public void onChanged() {
                        super.onChanged();
                        Multiple.this.mActivity.updateTitle();
                        Multiple.this.mDoneButton.setEnabled(Multiple.this.mActivity.mPicker.count() >= Multiple.this.mActivity.mPicker.baseline());
                    }

                    public void onInvalidated() {
                        super.onInvalidated();
                        Multiple.this.mActivity.updateTitle();
                        Multiple.this.mDoneButton.setEnabled(Multiple.this.mActivity.mPicker.count() >= Multiple.this.mActivity.mPicker.baseline());
                    }
                });
            }

            public void applyTheme() {
            }

            public void setPickerTitle(CharSequence charSequence) {
                this.mTitle.setText(charSequence);
            }

            public void setTitle(CharSequence charSequence) {
            }
        }

        protected Decor(PickerActivity pickerActivity) {
            this.mActivity = pickerActivity;
        }

        public static Decor create(PickerActivity pickerActivity) {
            return new Multiple(pickerActivity);
        }

        public abstract void applyActionBar();

        public abstract void applyTheme();

        public abstract void setPickerTitle(CharSequence charSequence);

        public abstract void setTitle(CharSequence charSequence);
    }

    protected static class SimplePicker implements Picker {
        private final int mBaseline;
        private final int mCapacity;
        private ImageType mImageType = ImageType.THUMBNAIL;
        private MediaType mMediaType;
        private DataSetObservable mObservable;
        private Mode mPickMode;
        private PickerActivity mPickerActivity;
        private ResultType mResultType;
        private List<String> mResults;

        public SimplePicker(PickerActivity pickerActivity, int i, int i2, List<String> list) {
            if (list != null) {
                if (i < 0) {
                    this.mPickMode = Mode.UNLIMITED;
                    i = Integer.MAX_VALUE;
                } else if (i > 1) {
                    this.mPickMode = Mode.MULTIPLE;
                } else {
                    this.mPickMode = Mode.SINGLE;
                    i = 1;
                }
                if (list.size() <= i) {
                    this.mPickerActivity = pickerActivity;
                    this.mResults = list;
                    this.mCapacity = i;
                    this.mBaseline = i2;
                    this.mObservable = new DataSetObservable();
                    return;
                }
                throw new IllegalArgumentException(String.format("ResultMap size (%d) is too large this picker (%d)", new Object[]{Integer.valueOf(list.size()), Integer.valueOf(i)}));
            }
            throw new IllegalArgumentException("Result can't be null");
        }

        public int baseline() {
            return this.mBaseline;
        }

        public void cancel() {
            this.mPickerActivity.onCancel();
        }

        public int capacity() {
            return this.mCapacity;
        }

        public boolean clear() {
            if (this.mResults.isEmpty()) {
                return false;
            }
            this.mResults.clear();
            this.mObservable.notifyChanged();
            return true;
        }

        public boolean contains(String str) {
            return this.mResults.contains(str);
        }

        public int count() {
            return this.mResults.size();
        }

        public void done() {
            this.mPickerActivity.onDone();
        }

        public ImageType getImageType() {
            return this.mImageType;
        }

        public MediaType getMediaType() {
            return this.mMediaType;
        }

        public Mode getMode() {
            return this.mPickMode;
        }

        public ResultType getResultType() {
            return this.mResultType;
        }

        public boolean isFull() {
            return count() >= capacity();
        }

        public Iterator<String> iterator() {
            return this.mResults.iterator();
        }

        public boolean pick(String str) {
            if (isFull()) {
                return false;
            }
            boolean z = !this.mResults.contains(str);
            if (z) {
                this.mResults.add(str);
                this.mObservable.notifyChanged();
            }
            return z;
        }

        public void registerObserver(DataSetObserver dataSetObserver) {
            this.mObservable.registerObserver(dataSetObserver);
        }

        public boolean remove(String str) {
            boolean remove = this.mResults.remove(str);
            if (remove) {
                this.mObservable.notifyChanged();
            }
            return remove;
        }

        public void setImageType(ImageType imageType) {
            this.mImageType = imageType;
        }

        public void setMediaType(MediaType mediaType) {
            this.mMediaType = mediaType;
        }

        public void setResultType(ResultType resultType) {
            this.mResultType = resultType;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("SimplePicker{mResults=");
            sb.append(this.mResults);
            sb.append('}');
            return sb.toString();
        }
    }

    /* JADX WARNING: Incorrect type for immutable var: ssa=com.miui.gallery.picker.helper.Picker, code=com.miui.gallery.picker.helper.Picker<java.lang.String>, for r2v0, types: [com.miui.gallery.picker.helper.Picker<java.lang.String>, com.miui.gallery.picker.helper.Picker] */
    public static ArrayList<String> copyPicker(Picker<String> picker) {
        if (picker == null) {
            return new ArrayList<>(0);
        }
        ArrayList<String> arrayList = new ArrayList<>(picker.count());
        for (String add : picker) {
            arrayList.add(add);
        }
        return arrayList;
    }

    private void restoreInstanceState(Bundle bundle) {
        Log.d("PickerActivity", "restore instance state for picker: ");
        int i = bundle.getInt("com.miui.gallery.picker.PickerActivity.capacity", 1);
        int i2 = bundle.getInt("com.miui.gallery.picker.PickerActivity.baseline", 1);
        List list = (List) bundle.getSerializable("com.miui.gallery.picker.PickerActivity.results");
        if (list == null) {
            list = new ArrayList(i);
        }
        this.mPicker = new SimplePicker(this, i, i2, list);
        int i3 = bundle.getInt("com.miui.gallery.picker.PickerActivity.media_type");
        int i4 = bundle.getInt("com.miui.gallery.picker.PickerActivity.result_type");
        this.mPicker.setMediaType(MediaType.values()[i3]);
        this.mPicker.setResultType(ResultType.values()[i4]);
        Log.d("PickerActivity", "picker[capacity:%d, size:%d] restored.", Integer.valueOf(i), Integer.valueOf(list.size()));
    }

    public Picker getPicker() {
        return this.mPicker;
    }

    public void onAttachFragment(Fragment fragment) {
        super.onAttachFragment(fragment);
        if (fragment instanceof PickerFragment) {
            ((PickerFragment) fragment).attach(this.mPicker);
        }
    }

    /* access modifiers changed from: protected */
    public void onCancel() {
        super.finish();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        initActionBar();
        this.mDecor.applyActionBar();
        this.mDecor.setTitle(this.mTitle);
        this.mDecor.setPickerTitle(this.mPickerTitle);
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        if (bundle != null) {
            restoreInstanceState(bundle);
        } else {
            try {
                this.mPicker = onCreatePicker();
            } catch (RuntimeException e) {
                Log.e("PickerActivity", (Throwable) e);
                super.onCreate(bundle);
                finish();
                return;
            }
        }
        this.mDecor = onCreateDecor();
        this.mDecor.applyTheme();
        super.onCreate(bundle);
        this.mDecor.applyActionBar();
        updateTitle();
    }

    /* access modifiers changed from: protected */
    public Decor onCreateDecor() {
        return Decor.create(this);
    }

    /* JADX WARNING: type inference failed for: r9v0, types: [android.content.Context, com.miui.gallery.picker.PickerActivity] */
    /* access modifiers changed from: protected */
    public Picker onCreatePicker() {
        int i;
        Intent intent = getIntent();
        String resolveType = intent.resolveType(this);
        int i2 = 1;
        if (intent.hasExtra("pick-upper-bound")) {
            i = intent.getIntExtra("pick-upper-bound", -1);
            Log.d("PickerActivity", "initial pick bound: %d", (Object) Integer.valueOf(i));
        } else if (intent.getBooleanExtra("android.intent.extra.ALLOW_MULTIPLE", false)) {
            Log.d("PickerActivity", "standard pick multiple");
            i = -1;
        } else {
            i = 1;
        }
        int intExtra = intent.getIntExtra("pick-lower-bound", 1);
        if (intExtra < 1) {
            intExtra = 1;
        }
        if (i != -1 && intExtra <= i) {
            i2 = intExtra;
        }
        SimplePicker simplePicker = new SimplePicker(this, i, i2, new ArrayList());
        if ("image/*".equals(resolveType)) {
            simplePicker.setMediaType(MediaType.IMAGE);
        } else if ("video/*".equals(resolveType)) {
            simplePicker.setMediaType(MediaType.VIDEO);
        } else if ("vnd.android.cursor.dir/image".equals(resolveType)) {
            simplePicker.setMediaType(MediaType.IMAGE);
        } else if ("vnd.android.cursor.dir/video".equals(resolveType)) {
            simplePicker.setMediaType(MediaType.VIDEO);
        } else {
            simplePicker.setMediaType(MediaType.ALL);
        }
        if (intent.getBooleanExtra("pick-need-id", false)) {
            simplePicker.setResultType(ResultType.ID);
        } else if (GalleryOpenProvider.needReturnContentUri((Context) this, getCallingPackage())) {
            simplePicker.setResultType(ResultType.OPEN_URI);
        } else if ("vnd.android.cursor.dir/image".equals(resolveType) || "vnd.android.cursor.dir/video".equals(resolveType)) {
            simplePicker.setResultType(ResultType.LEGACY_MEDIA);
        } else {
            simplePicker.setResultType(ResultType.LEGACY_GENERAL);
        }
        if (intent.getBooleanExtra("pick-need-origin", false)) {
            simplePicker.setImageType(ImageType.ORIGIN);
        } else if (intent.getBooleanExtra("pick-need-origin-download-info", false)) {
            simplePicker.setImageType(ImageType.ORIGIN_OR_DOWNLOAD_INFO);
        }
        Log.d("PickerActivity", "creating picker, capacity is %d", (Object) Integer.valueOf(i));
        return simplePicker;
    }

    /* access modifiers changed from: protected */
    public abstract void onDone();

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putSerializable("com.miui.gallery.picker.PickerActivity.results", copyPicker(this.mPicker));
        bundle.putSerializable("com.miui.gallery.picker.PickerActivity.capacity", Integer.valueOf(this.mPicker.getMode() == Mode.UNLIMITED ? -1 : this.mPicker.capacity()));
        bundle.putSerializable("com.miui.gallery.picker.PickerActivity.baseline", Integer.valueOf(this.mPicker.baseline()));
        bundle.putInt("com.miui.gallery.picker.PickerActivity.media_type", this.mPicker.getMediaType().ordinal());
        bundle.putInt("com.miui.gallery.picker.PickerActivity.result_type", this.mPicker.getResultType().ordinal());
    }

    public final void setPickerTitle(CharSequence charSequence) {
        this.mPickerTitle = charSequence;
        this.mDecor.setPickerTitle(charSequence);
    }

    public final void setTitle(CharSequence charSequence) {
        this.mTitle = charSequence;
        this.mDecor.setTitle(this.mTitle);
    }

    /* access modifiers changed from: protected */
    public final void updateTitle() {
        String str;
        int count = this.mPicker.count();
        Mode mode = this.mPicker.getMode();
        if (count > 0) {
            if (mode == Mode.MULTIPLE) {
                str = getString(R.string.picker_title_selection_format_multiple, new Object[]{Integer.valueOf(this.mPicker.baseline()), Integer.valueOf(this.mPicker.capacity()), Integer.valueOf(count)});
            } else {
                str = getString(R.string.picker_title_selection_format, new Object[]{Integer.valueOf(count)});
            }
            setPickerTitle(str);
        } else if (mode == Mode.MULTIPLE) {
            if (this.mPicker.baseline() != this.mPicker.capacity()) {
                setPickerTitle(getString(R.string.picker_title_format, new Object[]{Integer.valueOf(this.mPicker.baseline()), Integer.valueOf(this.mPicker.capacity())}));
                return;
            }
            setPickerTitle(getString(R.string.picker_title_specify_format, new Object[]{Integer.valueOf(this.mPicker.baseline())}));
        } else if (mode == Mode.SINGLE) {
            setPickerTitle(getString(R.string.picker_title_specify_format_one, new Object[]{Integer.valueOf(this.mPicker.capacity())}));
        } else {
            setPickerTitle(getString(R.string.picker_title_unlimit));
        }
    }
}
