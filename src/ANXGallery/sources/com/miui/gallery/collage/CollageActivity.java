package com.miui.gallery.collage;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import com.android.internal.WindowCompat;
import com.miui.gallery.R;
import com.miui.gallery.activity.ExternalPhotoPageActivity;
import com.miui.gallery.collage.core.CollagePresenter;
import com.miui.gallery.collage.core.Effect;
import com.miui.gallery.collage.core.ViewInterface;
import com.miui.gallery.picker.PickGalleryActivity;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SystemUiUtil;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.io.File;
import java.util.ArrayList;
import miui.app.ProgressDialog;

public class CollageActivity extends Activity implements ViewInterface {
    private BitmapLoaderListener mBitmapLoaderListener = new BitmapLoaderListener() {
        public void onBitmapLoad(Bitmap[] bitmapArr) {
            CollageActivity.this.onBitmapDecodeFinishAfterChoose();
        }

        public void onBitmapReplace(Bitmap bitmap, Bitmap bitmap2) {
            CollageActivity.this.notifyBitmapReplace(bitmap, bitmap2);
        }
    };
    /* access modifiers changed from: private */
    public BitmapManager mBitmapManager;
    private TextView mCancel;
    private OnClickListener mCancelListener = new OnClickListener() {
        public void onClick(View view) {
            CollageActivity.this.finish();
        }
    };
    private OnCheckedChangeListener mCheckedChangeListener = new OnCheckedChangeListener() {
        public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
            if (z) {
                CollageActivity.this.onSelectRadio(compoundButton);
            }
        }
    };
    private int mCurrentImageSize = 1;
    /* access modifiers changed from: private */
    public CollagePresenter mCurrentPresenter;
    private View mLoadingProgressView;
    private CollagePresenter[] mPresenters;
    private RadioGroup mRadioGroup;
    private Rect mRectTemp = new Rect();
    private View mRenderContainer;
    private Bitmap mReplaceBitmapFrom;
    private ViewGroup mRootView;
    private TextView mSave;
    private OnClickListener mSaveListener = new OnClickListener() {
        public void onClick(View view) {
            if (CollageActivity.this.mCurrentPresenter != null && !CollageActivity.this.mCurrentPresenter.isActivating()) {
                CollageActivity.this.mCurrentPresenter.doSave(CollageActivity.this.mBitmapManager);
            }
        }
    };
    private ProgressDialog mSaveProgressDialog;

    public interface ReplaceImageListener {
        void onReplace(Bitmap bitmap);
    }

    private void decodeBitmapAsync(Uri[] uriArr) {
        this.mBitmapManager.loadBitmapAsync(uriArr);
    }

    private void dismissLoading() {
        if (this.mLoadingProgressView != null) {
            this.mRootView.removeView(this.mLoadingProgressView);
            this.mLoadingProgressView = null;
        }
    }

    private void enableButton() {
        this.mSave.setEnabled(true);
    }

    private void findViews() {
        this.mRadioGroup = (RadioGroup) findViewById(R.id.collage_title_parent);
        this.mSave = (TextView) findViewById(R.id.collage_save);
        this.mCancel = (TextView) findViewById(R.id.collage_back);
        this.mRenderContainer = findViewById(R.id.render_fragment_container);
        this.mLoadingProgressView = findViewById(R.id.progress_view);
        this.mRootView = (ViewGroup) findViewById(R.id.collage_root);
    }

    private void gotoPhotoPage(String str) {
        Intent intent = new Intent(this, ExternalPhotoPageActivity.class);
        intent.setData(Uri.fromFile(new File(str)));
        startActivity(intent);
    }

    private void init() {
        this.mBitmapManager = new BitmapManager(this, this.mBitmapLoaderListener);
    }

    private void initPresenter() {
        ArrayList arrayList = new ArrayList();
        for (Effect generatePresenter : Effect.values()) {
            CollagePresenter generatePresenter2 = generatePresenter.generatePresenter();
            if (generatePresenter2.supportImageSize(this.mCurrentImageSize)) {
                generatePresenter2.setImageSize(this.mCurrentImageSize);
                arrayList.add(generatePresenter2);
            }
        }
        this.mPresenters = new CollagePresenter[arrayList.size()];
        arrayList.toArray(this.mPresenters);
    }

    private void initView() {
        CollagePresenter[] collagePresenterArr;
        for (CollagePresenter collagePresenter : this.mPresenters) {
            RadioButton radioButton = (RadioButton) LayoutInflater.from(this).inflate(R.layout.collage_radio_item, this.mRadioGroup, false);
            this.mRadioGroup.addView(radioButton);
            radioButton.setText(collagePresenter.getTitle());
            radioButton.setContentDescription(radioButton.getText());
            radioButton.setOnCheckedChangeListener(this.mCheckedChangeListener);
        }
        this.mRadioGroup.check(this.mRadioGroup.getChildAt(0).getId());
        this.mCancel.setOnClickListener(this.mCancelListener);
        this.mSave.setOnClickListener(this.mSaveListener);
    }

    /* access modifiers changed from: private */
    public void notifyBitmapReplace(Bitmap bitmap, Bitmap bitmap2) {
        for (CollagePresenter notifyBitmapReplace : this.mPresenters) {
            notifyBitmapReplace.notifyBitmapReplace(bitmap, bitmap2);
        }
    }

    private void notifyBitmapsReceive() {
        if (!this.mBitmapManager.isEmpty()) {
            dismissLoading();
            for (CollagePresenter notifyReceiveBitmaps : this.mPresenters) {
                notifyReceiveBitmaps.notifyReceiveBitmaps();
            }
            enableButton();
        }
    }

    /* access modifiers changed from: private */
    public void onBitmapDecodeFinishAfterChoose() {
        if (!this.mBitmapManager.isEmpty()) {
            this.mCurrentImageSize = this.mBitmapManager.size();
            notifyBitmapsReceive();
        }
    }

    private void onSelectPresenter(int i) {
        CollagePresenter collagePresenter = this.mPresenters[i];
        collagePresenter.attach(this);
        FragmentManager fragmentManager = getFragmentManager();
        FragmentTransaction beginTransaction = fragmentManager.beginTransaction();
        if (this.mCurrentPresenter != null) {
            beginTransaction.hide(fragmentManager.findFragmentByTag(this.mCurrentPresenter.getMenuFragmentTag()));
            beginTransaction.hide(fragmentManager.findFragmentByTag(this.mCurrentPresenter.getRenderFragmentTag()));
        }
        this.mCurrentPresenter = collagePresenter;
        String menuFragmentTag = collagePresenter.getMenuFragmentTag();
        String renderFragmentTag = collagePresenter.getRenderFragmentTag();
        Fragment findFragmentByTag = fragmentManager.findFragmentByTag(menuFragmentTag);
        Fragment findFragmentByTag2 = fragmentManager.findFragmentByTag(renderFragmentTag);
        if (findFragmentByTag2 == null) {
            beginTransaction.add(R.id.render_fragment_container, collagePresenter.getRenderFragment(), renderFragmentTag);
        } else {
            beginTransaction.show(findFragmentByTag2);
        }
        if (findFragmentByTag == null) {
            beginTransaction.add(R.id.menu_fragment_container, collagePresenter.getMenuFragment(), menuFragmentTag);
        } else {
            beginTransaction.show(findFragmentByTag);
        }
        beginTransaction.commit();
        fragmentManager.executePendingTransactions();
    }

    /* access modifiers changed from: private */
    public void onSelectRadio(View view) {
        onSelectPresenter(this.mRadioGroup.indexOfChild(view));
    }

    private void receiveImages(ClipData clipData) {
        int min = Math.min(clipData.getItemCount(), 6);
        Uri[] uriArr = new Uri[min];
        for (int i = 0; i < min; i++) {
            uriArr[i] = resolveUri(clipData.getItemAt(i).getUri());
        }
        this.mCurrentImageSize = min;
        decodeBitmapAsync(uriArr);
    }

    private void resolveIntent() {
        Intent intent = getIntent();
        if (intent != null) {
            GallerySamplingStatHelper.recordCountEvent("collage", "collage_enter");
            receiveImages(intent.getClipData());
        }
    }

    private Uri resolveUri(Uri uri) {
        return uri.getAuthority().equals("com.miui.gallery.open") ? Uri.fromFile(new File(uri.getLastPathSegment())) : uri;
    }

    private void showProgressDialog() {
        this.mSaveProgressDialog = new ProgressDialog(this);
        this.mSaveProgressDialog.setMessage(getString(R.string.photo_editor_saving));
        this.mSaveProgressDialog.setCancelable(false);
        this.mSaveProgressDialog.setCanceledOnTouchOutside(false);
        this.mSaveProgressDialog.setIndeterminate(true);
        this.mSaveProgressDialog.show();
    }

    private void startPicker(int i, int i2) {
        Intent intent = new Intent(this, PickGalleryActivity.class);
        intent.setType("image/*");
        intent.putExtra("pick-upper-bound", i2);
        startActivityForResult(intent, i);
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0 && this.mRenderContainer != null) {
            this.mRenderContainer.getGlobalVisibleRect(this.mRectTemp);
            if (!this.mRectTemp.contains(Math.round(motionEvent.getX()), Math.round(motionEvent.getY()))) {
                this.mCurrentPresenter.dismissControlWindow();
            }
        }
        return super.dispatchTouchEvent(motionEvent);
    }

    public Bitmap[] getBitmaps() {
        return this.mBitmapManager.data();
    }

    public Context getContext() {
        return this;
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        Log.d("CollageActivity", "onActivityResult");
        switch (i) {
            case 0:
                if (i2 != -1) {
                    finish();
                    return;
                } else {
                    receiveImages(intent.getClipData());
                    return;
                }
            case 1:
                if (i2 == -1) {
                    this.mBitmapManager.replaceBitmap(this.mReplaceBitmapFrom, resolveUri(intent.getData()));
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void onAttachFragment(Fragment fragment) {
        super.onAttachFragment(fragment);
        if (this.mCurrentPresenter != null) {
            this.mCurrentPresenter.onAttachFragment(fragment);
        }
    }

    public void onAttachedToWindow() {
        if (WindowCompat.isNotch(this)) {
            SystemUiUtil.extendToStatusBar(getWindow().getDecorView());
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(null);
        WindowCompat.setCutoutModeShortEdges(getWindow());
        getWindow().setFlags(1024, 1024);
        SystemUiUtil.setDrawSystemBarBackground(getWindow());
        setContentView(R.layout.collage_main);
        init();
        findViews();
        resolveIntent();
        initPresenter();
        initView();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        if (this.mSaveProgressDialog != null) {
            this.mSaveProgressDialog.dismiss();
        }
        for (CollagePresenter detach : this.mPresenters) {
            detach.detach();
        }
        if (this.mBitmapManager != null) {
            this.mBitmapManager.setBitmapLoaderListener(null);
        }
        super.onDestroy();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        ImageLoader.getInstance().pause();
    }

    public void onReplaceBitmap(Bitmap bitmap) {
        if (bitmap != null) {
            Log.d("CollageActivity", "replace bitmap : %s", (Object) bitmap);
            this.mReplaceBitmapFrom = bitmap;
            startPicker(1, 1);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        ImageLoader.getInstance().resume();
    }

    public void onSaveFinish(String str, boolean z) {
        if (z && !TextUtils.isEmpty(str)) {
            gotoPhotoPage(str);
        }
        setResult(-1);
        finish();
    }

    public void onSaving() {
        showProgressDialog();
    }
}
