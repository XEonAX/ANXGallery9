package com.miui.gallery.video.editor.ui;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.TextStyle;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.adapter.WatermarkRecyclerViewAdapter;
import com.miui.gallery.video.editor.factory.WaterMartFactory;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager.ILoadAssetTemplate;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager.ILoadWaterMarkListener;
import com.miui.gallery.video.editor.manager.VideoEditorDataManager;
import com.miui.gallery.video.editor.manager.WaterMarkManager;
import com.miui.gallery.video.editor.model.LocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseLocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import com.miui.gallery.video.editor.net.VideoEditorResourceRequest;
import com.miui.gallery.video.editor.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.video.editor.ui.menu.WaterMarkView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.ItemSelectChangeListener;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class WaterMarkFragment extends MenuFragment implements OnClickListener {
    private final int AUTO_TEXT_WATER_MARK_INDEX = 1;
    /* access modifiers changed from: private */
    public WatermarkRecyclerViewAdapter mAdapter;
    private TextView mAllActionButton;
    /* access modifiers changed from: private */
    public EditText mAutoText;
    /* access modifiers changed from: private */
    public TextStyle mDownloadingTextStyle;
    private TextView mEndActionButton;
    /* access modifiers changed from: private */
    public String mInputText = "";
    /* access modifiers changed from: private */
    public boolean mIsKeyboardShowing = false;
    private ImageView mIvCancel;
    private ImageView mIvOk;
    /* access modifiers changed from: private */
    public TextStyle mLastSelectedTextStyle;
    private LinearLayoutManager mLinearLayoutManager;
    private OnGlobalLayoutListener mOnGlobalLayoutListener = new OnGlobalLayoutListener() {
        public void onGlobalLayout() {
            Log.d("WaterMarkFragment", "---onGlobalLayout start---");
            View rootView = WaterMarkFragment.this.mTextRoot.getRootView();
            int exactScreenHeight = ScreenUtils.getExactScreenHeight(WaterMarkFragment.this.getActivity());
            int height = rootView.getHeight();
            int[] iArr = new int[2];
            rootView.getLocationOnScreen(iArr);
            int i = (exactScreenHeight - height) - iArr[1];
            if (!WaterMarkFragment.this.mIsKeyboardShowing && i > 0) {
                Log.d("WaterMarkFragment", "soft keyboard start to show!");
                WaterMarkFragment.this.mIsKeyboardShowing = true;
                WaterMarkFragment.this.mTextAppearAnimator.start();
            }
            if (i == 0 && WaterMarkFragment.this.mIsKeyboardShowing) {
                Log.d("WaterMarkFragment", "soft keyboard start to dismiss!");
                WaterMarkFragment.this.dismissTextPopWindow();
                WaterMarkFragment.this.mIsKeyboardShowing = true ^ WaterMarkFragment.this.applyPlay();
            }
        }
    };
    private final long mPopWindowEnterAnimTime = 280;
    /* access modifiers changed from: private */
    public int mSavedSelectedWaterMarkIndex;
    private ConstraintLayout mSelectTimeLayout;
    /* access modifiers changed from: private */
    public TextStyle mSelectedTextStyle;
    /* access modifiers changed from: private */
    public int mSelectedTextTime = 0;
    /* access modifiers changed from: private */
    public SingleChoiceRecyclerView mSingleChoiceRecyclerView;
    private TextView mStartActionButton;
    /* access modifiers changed from: private */
    public ObjectAnimator mTextAppearAnimator;
    private ImageView mTextCancel;
    /* access modifiers changed from: private */
    public boolean mTextEditable = false;
    private PopupWindow mTextPopWindow;
    /* access modifiers changed from: private */
    public View mTextRoot;
    private ImageView mTextSave;
    /* access modifiers changed from: private */
    public ArrayList<TextStyle> mTextStyles = new ArrayList<>();
    private ConstraintLayout mTitleLayout;
    private VideoEditorResourceRequest mVideoEditorResourceRequest;
    /* access modifiers changed from: private */
    public WaterMarkManager mWaterMarkManager;

    private class MyTextItemSelectChangeListener implements ItemSelectChangeListener {
        private MyTextItemSelectChangeListener() {
        }

        public boolean onItemSelect(SingleChoiceRecyclerViewAdapter singleChoiceRecyclerViewAdapter, final int i, boolean z) {
            if (WaterMarkFragment.this.hasOtherItemDownloading()) {
                return false;
            }
            WatermarkRecyclerViewAdapter watermarkRecyclerViewAdapter = (WatermarkRecyclerViewAdapter) singleChoiceRecyclerViewAdapter;
            ScrollControlLinearLayoutManager.onItemClick(WaterMarkFragment.this.mSingleChoiceRecyclerView, i);
            TextStyle textStyle = watermarkRecyclerViewAdapter.getTextStyle(i);
            if (textStyle == null || (!z && !textStyle.isLocal())) {
                return false;
            }
            if (textStyle.isNone()) {
                WaterMarkFragment.this.updateBottomBtnTitle(i);
                WaterMarkFragment.this.mTextEditable = false;
                WaterMarkFragment.this.mLastSelectedTextStyle = WaterMarkFragment.this.mSelectedTextStyle;
                WaterMarkFragment.this.mSelectedTextStyle = textStyle;
                WaterMarkFragment.this.mVideoEditor.setAutoWaterMark("", WaterMarkFragment.this.mSelectedTextTime);
                WaterMarkFragment.this.mVideoEditor.setWarterMark(WaterMarkFragment.this.mSelectedTextTime, "");
                return WaterMarkFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                    public void onCompleted() {
                        WaterMarkFragment.this.mVideoEditor.play();
                        WaterMarkFragment.this.updateSelectedItemPosition(i);
                        WaterMarkFragment.this.recordEventWithEffectChanged();
                        WaterMarkFragment.this.updatePalyBtnView();
                    }
                });
            }
            if (textStyle.isExtra()) {
                WaterMarkFragment.this.mTextEditable = false;
                if (textStyle.isDownloaded()) {
                    WaterMarkFragment.this.updateBottomBtnTitle(i);
                    WaterMarkFragment.this.updateBottomBtnState();
                    WaterMarkFragment.this.mLastSelectedTextStyle = WaterMarkFragment.this.mSelectedTextStyle;
                    WaterMarkFragment.this.mSelectedTextStyle = textStyle;
                    WaterMarkFragment.this.mVideoEditor.setAutoWaterMark("", WaterMarkFragment.this.mSelectedTextTime);
                    WaterMarkFragment.this.mVideoEditor.setWarterMark(WaterMarkFragment.this.mSelectedTextTime, textStyle.getTemplateId());
                    return WaterMarkFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                        public void onCompleted() {
                            WaterMarkFragment.this.mVideoEditor.play();
                            WaterMarkFragment.this.updateSelectedItemPosition(i);
                            WaterMarkFragment.this.recordEventWithEffectChanged();
                            WaterMarkFragment.this.updatePalyBtnView();
                        }
                    });
                }
                WaterMarkFragment.this.mIDownloadListener.downloadResourceWithCheck(textStyle, i);
                WaterMarkFragment.this.mDownloadingTextStyle = textStyle;
            } else if (textStyle.isLocal()) {
                WaterMarkFragment.this.mLastSelectedTextStyle = WaterMarkFragment.this.mSelectedTextStyle;
                WaterMarkFragment.this.mSelectedTextStyle = textStyle;
                if (TextUtils.isEmpty(WaterMarkFragment.this.mInputText)) {
                    WaterMarkFragment.this.showEditPopWindow();
                    WaterMarkFragment.this.showSoftInput();
                    WaterMarkFragment.this.mVideoEditor.pause();
                } else if (!WaterMarkFragment.this.mTextEditable) {
                    WaterMarkFragment.this.updateEffectInfo();
                    WaterMarkFragment.this.applyPlay();
                } else {
                    WaterMarkFragment.this.showEditPopWindow();
                    WaterMarkFragment.this.showSoftInput();
                    WaterMarkFragment.this.mVideoEditor.pause();
                }
                WaterMarkFragment.this.updateBottomBtnState();
            }
            return false;
        }
    }

    /* access modifiers changed from: private */
    public boolean applyPlay() {
        return this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                WaterMarkFragment.this.mVideoEditor.play();
                WaterMarkFragment.this.recordEventWithEffectChanged();
                WaterMarkFragment.this.updatePalyBtnView();
            }
        });
    }

    /* access modifiers changed from: private */
    public void dismissTextPopWindow() {
        this.mTextPopWindow.dismiss();
    }

    /* access modifiers changed from: private */
    public boolean hasOtherItemDownloading() {
        if (this.mTextStyles != null && this.mTextStyles.size() > 0) {
            Iterator it = this.mTextStyles.iterator();
            while (it.hasNext()) {
                TextStyle textStyle = (TextStyle) it.next();
                if (textStyle != null && textStyle.isDownloading()) {
                    return true;
                }
            }
        }
        return false;
    }

    private void hideSoftInput() {
        if (this.mAutoText != null) {
            Context context = this.mAutoText.getContext();
            Context context2 = this.mContext;
            InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService("input_method");
            if (inputMethodManager != null) {
                inputMethodManager.hideSoftInputFromWindow(this.mAutoText.getWindowToken(), 0);
            }
        }
    }

    private void initEditPopWindow() {
        this.mTextRoot = LayoutInflater.from(getActivity()).inflate(R.layout.video_editor_fragment_text_pop_window, null);
        this.mAutoText = (EditText) this.mTextRoot.findViewById(R.id.et_pop_window);
        this.mTextCancel = (ImageView) this.mTextRoot.findViewById(R.id.video_editor_btn_cancel);
        this.mTextSave = (ImageView) this.mTextRoot.findViewById(R.id.video_editor_btn_ok);
        this.mTextPopWindow = new PopupWindow(this.mTextRoot, -1, -1, true);
        this.mTextPopWindow.setFocusable(true);
        this.mTextPopWindow.setOutsideTouchable(true);
        this.mTextPopWindow.setBackgroundDrawable(new BitmapDrawable());
        this.mTextPopWindow.setSoftInputMode(16);
        this.mTextCancel.setOnClickListener(this);
        this.mTextSave.setOnClickListener(this);
    }

    private void initEnterAnim() {
        if (this.mTextRoot != null) {
            this.mTextAppearAnimator = new ObjectAnimator();
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.video_editor_water_mark_in_distance);
            PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) dimensionPixelSize, 0.0f});
            PropertyValuesHolder ofFloat2 = PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f});
            this.mTextAppearAnimator.setValues(new PropertyValuesHolder[]{ofFloat, ofFloat2});
            this.mTextAppearAnimator.setInterpolator(new CubicEaseOutInterpolator());
            this.mTextAppearAnimator.setDuration(280);
            this.mTextAppearAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                    Log.d("WaterMarkFragment", "water mark popwinow appear animation cancel!");
                }

                public void onAnimationEnd(Animator animator) {
                    if (!TextUtils.isEmpty(WaterMarkFragment.this.mInputText)) {
                        WaterMarkFragment.this.mAutoText.setText(WaterMarkFragment.this.mInputText);
                        WaterMarkFragment.this.mAutoText.setSelection(WaterMarkFragment.this.mInputText.length());
                    }
                    Log.d("WaterMarkFragment", "water mark popwinow appear animation end!");
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                    Log.d("WaterMarkFragment", "water mark popwinow appear animation start!");
                }
            });
            this.mTextAppearAnimator.setTarget(this.mTextRoot);
        }
    }

    private void initListener() {
        this.mStartActionButton.setOnClickListener(this);
        this.mEndActionButton.setOnClickListener(this);
        this.mAllActionButton.setOnClickListener(this);
        this.mIvCancel.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                WaterMarkFragment.this.doCancel();
            }
        });
        this.mIvOk.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                WaterMarkFragment.this.doApply();
            }
        });
    }

    private void initRecylerView(View view) {
        this.mSingleChoiceRecyclerView = (SingleChoiceRecyclerView) view.findViewById(R.id.recycler_view);
        this.mLinearLayoutManager = new ScrollControlLinearLayoutManager(this.mContext, 0, false);
        this.mSingleChoiceRecyclerView.setLayoutManager(this.mLinearLayoutManager);
        this.mAdapter = new WatermarkRecyclerViewAdapter(this.mContext, this.mTextStyles);
        this.mAdapter.setItemSelectChangeListener(new MyTextItemSelectChangeListener());
        this.mSingleChoiceRecyclerView.setAdapter(this.mAdapter);
        this.mSingleChoiceRecyclerView.addItemDecoration(new BlankDivider(getResources(), R.dimen.editor_water_mark_item_gap, 0));
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mSingleChoiceRecyclerView);
        this.mAdapter.setSelectedItemPosition(this.mSavedSelectedWaterMarkIndex);
        updateBottomBtnTitle(this.mSavedSelectedWaterMarkIndex);
    }

    /* access modifiers changed from: private */
    public void refreshData(List<VideoEditorBaseLocalResource> list) {
        List localTemplateEntities = this.mModuleFactory.getLocalTemplateEntities(this.mContext);
        if (list != null) {
            localTemplateEntities.addAll(list);
        }
        if (localTemplateEntities.size() > 0) {
            localTemplateEntities.add(1, new LocalResource(R.drawable.video_editor_water_mark_text, "ve_type_local"));
        }
        final ArrayList arrayList = new ArrayList();
        arrayList.addAll(VideoEditorDataManager.loadWaterMarks(localTemplateEntities));
        NexAssetTemplateManager.getInstance().loadWaterMarkTemplateList(new ILoadWaterMarkListener() {
            public void onFinished(String[] strArr) {
                WaterMarkFragment.this.mWaterMarkManager.initDataWithTemplate(strArr, arrayList);
                ThreadManager.runOnMainThread(new Runnable() {
                    public void run() {
                        WaterMarkFragment.this.mTextStyles.clear();
                        WaterMarkFragment.this.mTextStyles.addAll(arrayList);
                        if (WaterMarkFragment.this.mAdapter != null) {
                            WaterMarkFragment.this.mAdapter.notifyDataSetChanged();
                        }
                    }
                });
            }
        });
    }

    /* access modifiers changed from: private */
    public void showEditPopWindow() {
        this.mTextRoot.getViewTreeObserver().addOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
        this.mTextPopWindow.showAtLocation(this.mSingleChoiceRecyclerView, 51, 0, 0);
        this.mTextRoot.setAlpha(0.0f);
    }

    /* access modifiers changed from: private */
    public void showSoftInput() {
        if (this.mAutoText != null) {
            this.mAutoText.requestFocus();
            this.mAutoText.requestFocusFromTouch();
            this.mAutoText.post(new Runnable() {
                public void run() {
                    Context context = WaterMarkFragment.this.mAutoText.getContext();
                    WaterMarkFragment.this.getActivity();
                    InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService("input_method");
                    if (inputMethodManager != null) {
                        inputMethodManager.showSoftInput(WaterMarkFragment.this.mAutoText, 0);
                    }
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void updateBottomBtnState() {
        if (this.mSelectedTextTime == 0) {
            this.mStartActionButton.setSelected(true);
            this.mEndActionButton.setSelected(false);
            this.mAllActionButton.setSelected(false);
        } else if (this.mSelectedTextTime == 1) {
            this.mStartActionButton.setSelected(false);
            this.mEndActionButton.setSelected(true);
            this.mAllActionButton.setSelected(false);
        } else if (this.mSelectedTextTime == 2) {
            this.mStartActionButton.setSelected(false);
            this.mEndActionButton.setSelected(false);
            this.mAllActionButton.setSelected(true);
        }
    }

    /* access modifiers changed from: private */
    public void updateBottomBtnTitle(int i) {
        int i2 = 0;
        if (i == 0 && this.mAllActionButton.isSelected()) {
            this.mAllActionButton.setSelected(false);
        }
        this.mSelectTimeLayout.setVisibility(i == 0 ? 8 : 0);
        ConstraintLayout constraintLayout = this.mTitleLayout;
        if (i != 0) {
            i2 = 8;
        }
        constraintLayout.setVisibility(i2);
    }

    /* access modifiers changed from: private */
    public void updateEffectInfo() {
        if (this.mSelectedTextStyle == null) {
            return;
        }
        if (this.mSelectedTextStyle.isLocal()) {
            if (TextUtils.isEmpty(this.mInputText)) {
                updateWithInputNoText();
                return;
            }
            this.mVideoEditor.setWarterMark(this.mSelectedTextTime, "");
            this.mVideoEditor.setAutoWaterMark(this.mInputText, this.mSelectedTextTime);
            int indexOf = this.mTextStyles.indexOf(this.mSelectedTextStyle);
            updateSelectedItemPosition(indexOf);
            updateBottomBtnTitle(indexOf);
            this.mTextEditable = true;
        } else if (this.mSelectedTextStyle.isNone()) {
            this.mVideoEditor.setAutoWaterMark("", this.mSelectedTextTime);
            this.mVideoEditor.setWarterMark(this.mSelectedTextTime, "");
        } else if (this.mSelectedTextStyle.isExtra() && this.mSelectedTextStyle.isDownloaded()) {
            this.mVideoEditor.setWarterMark(this.mSelectedTextTime, this.mSelectedTextStyle.getTemplateId());
        }
    }

    /* access modifiers changed from: private */
    public void updateSelectedItemPosition(int i) {
        if (this.mAdapter != null) {
            this.mAdapter.setSelectedItemPosition(i);
            this.mAdapter.clearLastSelectedPostion();
        }
    }

    private void updateWithInputNoText() {
        if (this.mAdapter != null) {
            int selectedItemPosition = this.mAdapter.getSelectedItemPosition();
            if (this.mLastSelectedTextStyle == null || this.mLastSelectedTextStyle.isLocal()) {
                updateSelectedItemPosition(selectedItemPosition);
                updateBottomBtnTitle(selectedItemPosition);
                this.mVideoEditor.setAutoWaterMark("", this.mSelectedTextTime);
                return;
            }
            this.mSelectedTextStyle = this.mLastSelectedTextStyle;
            int indexOf = this.mTextStyles.indexOf(this.mSelectedTextStyle);
            updateSelectedItemPosition(indexOf);
            updateBottomBtnTitle(indexOf);
            this.mVideoEditor.setAutoWaterMark("", this.mSelectedTextTime);
            this.mVideoEditor.setWarterMark(this.mSelectedTextTime, this.mSelectedTextStyle.getTemplateId());
        }
    }

    public boolean doApply() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.apply(new OnCompletedListener() {
                public void onCompleted() {
                    if (WaterMarkFragment.this.mVideoEditor != null) {
                        WaterMarkFragment.this.mSavedSelectedWaterMarkIndex = WaterMarkFragment.this.mAdapter.getSelectedItemPosition();
                        WaterMarkFragment.this.mVideoEditor.saveEditState();
                        WaterMarkFragment.this.recordEventWithApply();
                        WaterMarkFragment.this.onExitMode();
                        WaterMarkFragment.this.mVideoEditor.play();
                    }
                }
            });
        }
        Log.d("WaterMarkFragment", "doApply: videoEditor is null.");
        return false;
    }

    public boolean doCancel() {
        if (this.mVideoEditor == null) {
            Log.d("WaterMarkFragment", "doCancel: videoEditor is null.");
            return false;
        }
        this.mVideoEditor.restoreEditState();
        return this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                if (WaterMarkFragment.this.mVideoEditor != null) {
                    WaterMarkFragment.this.mVideoEditor.play();
                    WaterMarkFragment.this.recordEventWithCancel();
                    WaterMarkFragment.this.onExitMode();
                }
            }
        });
    }

    public List<String> getCurrentEffect() {
        if (this.mAdapter != null) {
            TextStyle textStyle = this.mAdapter.getTextStyle(this.mAdapter.getSelectedItemPosition());
            if (textStyle != null) {
                return Arrays.asList(new String[]{textStyle.getLabel()});
            }
        }
        return null;
    }

    public int getEffectId() {
        return R.id.video_editor_water_mark;
    }

    public void loadResourceData() {
        this.mModuleFactory = new WaterMartFactory();
        this.mVideoEditorResourceRequest = new VideoEditorResourceRequest(getEffectId(), this.mModuleFactory);
        this.mVideoEditorResourceRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                WaterMarkFragment.this.refreshData(objArr[0]);
            }

            public void onResponseError(final ErrorCode errorCode, String str, Object obj) {
                Log.d("WaterMarkFragment", "errorCode: %s", (Object) errorCode);
                ThreadManager.runOnMainThread(new Runnable() {
                    public void run() {
                        if (WaterMarkFragment.this.mTextStyles != null && WaterMarkFragment.this.mTextStyles.size() == 0) {
                            TextStyle textStyle = new TextStyle(R.drawable.video_editor_icon_water_mark_none, "ve_type_none");
                            TextStyle textStyle2 = new TextStyle(R.drawable.video_editor_water_mark_text, "ve_type_local");
                            WaterMarkFragment.this.mTextStyles.add(textStyle);
                            WaterMarkFragment.this.mTextStyles.add(textStyle2);
                            if (WaterMarkFragment.this.mAdapter != null) {
                                WaterMarkFragment.this.mAdapter.notifyDataSetChanged();
                            }
                        }
                        if (errorCode == ErrorCode.NETWORK_NOT_CONNECTED) {
                            ThreadManager.runOnMainThread(new Runnable() {
                                public void run() {
                                    ToastUtils.makeText(WaterMarkFragment.this.mContext, (int) R.string.video_editor_download_failed_for_notwork);
                                }
                            });
                        }
                    }
                });
            }
        });
    }

    public void notifyDateSetChanged(int i) {
        if (this.mAdapter != null) {
            this.mAdapter.notifyItemChanged(i, Integer.valueOf(1));
        }
    }

    public void onClick(View view) {
        if (view.getId() == R.id.video_editor_text_start) {
            this.mSelectedTextTime = 0;
            updateBottomBtnState();
            updateEffectInfo();
        } else if (view.getId() == R.id.video_editor_text_end) {
            this.mSelectedTextTime = 1;
            updateBottomBtnState();
            updateEffectInfo();
        } else if (view.getId() == R.id.video_editor_text_all) {
            this.mSelectedTextTime = 2;
            updateBottomBtnState();
            updateEffectInfo();
        } else if (view.getId() == R.id.video_editor_btn_ok) {
            this.mIsKeyboardShowing = false;
            this.mInputText = this.mAutoText.getText().toString();
            updateEffectInfo();
            hideSoftInput();
            dismissTextPopWindow();
        } else if (view.getId() == R.id.video_editor_btn_cancel) {
            this.mIsKeyboardShowing = false;
            updateEffectInfo();
            hideSoftInput();
            dismissTextPopWindow();
        }
        applyPlay();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mWaterMarkManager = new WaterMarkManager();
        loadResourceData();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new WaterMarkView(viewGroup.getContext());
    }

    public void onDestroyView() {
        if (this.mDownloadingTextStyle != null && this.mDownloadingTextStyle.isDownloading()) {
            this.mDownloadingTextStyle.setDownloadState(20);
        }
        if (this.mAdapter != null) {
            this.mAdapter.setItemSelectChangeListener(null);
            this.mAdapter = null;
        }
        if (this.mVideoEditorResourceRequest != null) {
            this.mVideoEditorResourceRequest.cancel();
        }
        if (this.mTextRoot != null) {
            this.mTextRoot.getViewTreeObserver().removeOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
        }
        if (this.mTextPopWindow != null) {
            this.mTextPopWindow.dismiss();
        }
        if (this.mTextAppearAnimator != null) {
            this.mTextAppearAnimator.removeAllListeners();
            this.mTextAppearAnimator.cancel();
        }
        this.mInputText = "";
        cancelRequest();
        super.onDestroyView();
    }

    public void onDownlaodCompleted(VideoEditorBaseModel videoEditorBaseModel, final int i) {
        final TextStyle textStyle = (TextStyle) videoEditorBaseModel;
        NexAssetTemplateManager.getInstance().installWaterMarkAssetPackageToSdk(textStyle.getAssetId(), new ILoadAssetTemplate() {
            public void onFail() {
                textStyle.setDownloadState(20);
                WaterMarkFragment.this.notifyDateSetChanged(i);
            }

            public void onSuccess() {
                NexAssetTemplateManager.getInstance().loadWaterMarkTemplateList(new ILoadWaterMarkListener() {
                    public void onFinished(String[] strArr) {
                        WaterMarkFragment.this.mWaterMarkManager.updateDataWithTemplate(strArr, textStyle);
                        WaterMarkFragment.this.notifyDateSetChanged(i);
                    }
                });
            }
        });
    }

    public void onPause() {
        super.onPause();
        hideSoftInput();
        this.mTextPopWindow.dismiss();
        this.mIsKeyboardShowing = false;
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mStartActionButton = (TextView) view.findViewById(R.id.video_editor_text_start);
        this.mEndActionButton = (TextView) view.findViewById(R.id.video_editor_text_end);
        this.mAllActionButton = (TextView) view.findViewById(R.id.video_editor_text_all);
        this.mSelectTimeLayout = (ConstraintLayout) view.findViewById(R.id.select_time_layout);
        this.mTitleLayout = (ConstraintLayout) view.findViewById(R.id.title_layout);
        this.mIvCancel = (ImageView) view.findViewById(R.id.cancel);
        this.mIvOk = (ImageView) view.findViewById(R.id.ok);
        initRecylerView(view);
        updateBottomBtnState();
        initListener();
        initEditPopWindow();
        initEnterAnim();
    }

    public void onViewStateRestored(Bundle bundle) {
        super.onViewStateRestored(bundle);
        this.mSavedSelectedWaterMarkIndex = this.mAdapter.getSelectedItemPosition();
    }
}
