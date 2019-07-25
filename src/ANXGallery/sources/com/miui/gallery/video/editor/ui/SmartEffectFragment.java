package com.miui.gallery.video.editor.ui;

import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.SmartEffect;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.adapter.SmartEffectRecyclerViewAdapter;
import com.miui.gallery.video.editor.factory.SmartEffectFactory;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager.ICheckExpiredAssetListener;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager.ILoadAssetTemplate;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager.ILoadSmartEffectListener;
import com.miui.gallery.video.editor.manager.SmartEffectManager;
import com.miui.gallery.video.editor.manager.VideoEditorDataManager;
import com.miui.gallery.video.editor.model.VideoEditorBaseLocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import com.miui.gallery.video.editor.net.VideoEditorResourceRequest;
import com.miui.gallery.video.editor.ui.menu.SmartEffectView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.ItemSelectChangeListener;
import com.nexstreaming.nexeditorsdk.nexTemplateManager.Template;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class SmartEffectFragment extends MenuFragment {
    private final String TAG = "SmartEffectFragment";
    /* access modifiers changed from: private */
    public SmartEffectRecyclerViewAdapter mAdapter;
    private View mCancelView;
    /* access modifiers changed from: private */
    public SmartEffect mDownloadingSmartEffect;
    /* access modifiers changed from: private */
    public View mLayout;
    private LinearLayoutManager mLinearLayoutManager;
    private View mOkView;
    private int mSavedSelectedSmartEffectIndex;
    /* access modifiers changed from: private */
    public SingleChoiceRecyclerView mSingleChoiceRecyclerView;
    /* access modifiers changed from: private */
    public SmartEffectManager mSmartEffectManager;
    /* access modifiers changed from: private */
    public ArrayList<SmartEffect> mSmartEffects = new ArrayList<>();
    private TextView mTitleView;
    /* access modifiers changed from: private */
    public Toast mToast;
    private VideoEditorResourceRequest mVideoEditorResourceRequest;
    /* access modifiers changed from: private */
    public int mVideoTotalTime;

    private class SmartEffectItemSelectChangeListener implements ItemSelectChangeListener {
        private SmartEffectItemSelectChangeListener() {
        }

        public boolean onItemSelect(SingleChoiceRecyclerViewAdapter singleChoiceRecyclerViewAdapter, int i, boolean z) {
            if (SmartEffectFragment.this.hasOtherItemDownloading() || !z) {
                return false;
            }
            ScrollControlLinearLayoutManager.onItemClick(SmartEffectFragment.this.mSingleChoiceRecyclerView, i);
            SmartEffect smartEffect = ((SmartEffectRecyclerViewAdapter) singleChoiceRecyclerViewAdapter).getSmartEffect(i);
            if (smartEffect != null) {
                if (smartEffect.isNone()) {
                    SmartEffectFragment.this.updateSelectedItemPosition(i);
                    SmartEffectFragment.this.mVideoEditor.setSmartEffectTemplate(smartEffect);
                    return SmartEffectFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                        public void onCompleted() {
                            SmartEffectFragment.this.mVideoEditor.play();
                            SmartEffectFragment.this.recordEventWithEffectChanged();
                            SmartEffectFragment.this.updatePalyBtnView();
                        }
                    });
                } else if (smartEffect.isExtra()) {
                    if (smartEffect.isDownloaded()) {
                        if (SmartEffectFragment.this.mToast != null) {
                            SmartEffectFragment.this.mToast.cancel();
                        }
                        int dimensionPixelSize = SmartEffectFragment.this.getResources().getDimensionPixelSize(R.dimen.video_editor_video_smart_effect_toast_gap);
                        if (SmartEffectFragment.this.mVideoTotalTime < smartEffect.getShortTime()) {
                            SmartEffectFragment.this.mToast = Toast.makeText(SmartEffectFragment.this.mContext, R.string.video_editor_smart_effect_time_limit_txt_6, 0);
                            SmartEffectFragment.this.mToast.setGravity(80, 0, SmartEffectFragment.this.mLayout.getHeight() - dimensionPixelSize);
                            SmartEffectFragment.this.mToast.show();
                            return false;
                        }
                        if (smartEffect.isHasSpeedChange() && !SmartEffectFragment.this.isHighFrames()) {
                            SmartEffectFragment.this.mToast = Toast.makeText(SmartEffectFragment.this.mContext, R.string.video_editor_smart_effect_high_iframes_text, 0);
                            SmartEffectFragment.this.mToast.setGravity(80, 0, SmartEffectFragment.this.mLayout.getHeight() - dimensionPixelSize);
                            SmartEffectFragment.this.mToast.show();
                        } else if (SmartEffectFragment.this.mVideoTotalTime > smartEffect.getLongTime() && smartEffect.isLimitSixtySeconds()) {
                            SmartEffectFragment.this.mToast = Toast.makeText(SmartEffectFragment.this.mContext, R.string.video_editor_smart_effect_time_limit_txt_60, 0);
                            SmartEffectFragment.this.mToast.setGravity(80, 0, SmartEffectFragment.this.mLayout.getHeight() - dimensionPixelSize);
                            SmartEffectFragment.this.mToast.show();
                        } else if (SmartEffectFragment.this.mVideoTotalTime > smartEffect.getLongTime() && smartEffect.isLimitFourtySeconds()) {
                            SmartEffectFragment.this.mToast = Toast.makeText(SmartEffectFragment.this.mContext, R.string.video_editor_smart_effect_time_limit_txt_40, 0);
                            SmartEffectFragment.this.mToast.setGravity(80, 0, SmartEffectFragment.this.mLayout.getHeight() - dimensionPixelSize);
                            SmartEffectFragment.this.mToast.show();
                        }
                        SmartEffectFragment.this.updateSelectedItemPosition(i);
                        SmartEffectFragment.this.mVideoEditor.setSmartEffectTemplate(smartEffect);
                        return SmartEffectFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                            public void onCompleted() {
                                SmartEffectFragment.this.mVideoEditor.play();
                                SmartEffectFragment.this.recordEventWithEffectChanged();
                                SmartEffectFragment.this.updatePalyBtnView();
                            }
                        });
                    }
                    SmartEffectFragment.this.mIDownloadListener.downloadResourceWithCheck(smartEffect, i);
                    SmartEffectFragment.this.mDownloadingSmartEffect = smartEffect;
                }
            }
            return false;
        }
    }

    /* access modifiers changed from: private */
    public boolean hasOtherItemDownloading() {
        if (this.mSmartEffects != null && this.mSmartEffects.size() > 0) {
            Iterator it = this.mSmartEffects.iterator();
            while (it.hasNext()) {
                SmartEffect smartEffect = (SmartEffect) it.next();
                if (smartEffect != null && smartEffect.isDownloading()) {
                    return true;
                }
            }
        }
        return false;
    }

    private void initListener() {
        this.mOkView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                SmartEffectFragment.this.doApply();
            }
        });
        this.mCancelView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                SmartEffectFragment.this.doCancel();
            }
        });
    }

    private void initRecyclerView(View view) {
        this.mSingleChoiceRecyclerView = (SingleChoiceRecyclerView) view.findViewById(R.id.recycler_view);
        this.mLinearLayoutManager = new ScrollControlLinearLayoutManager(this.mContext, 0, false);
        this.mSingleChoiceRecyclerView.setLayoutManager(this.mLinearLayoutManager);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.editor_smart_effect_item_start);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.editor_smart_effect_item_horizontal_interval);
        SingleChoiceRecyclerView singleChoiceRecyclerView = this.mSingleChoiceRecyclerView;
        BlankDivider blankDivider = new BlankDivider(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize2, 0, 0, 0);
        singleChoiceRecyclerView.addItemDecoration(blankDivider);
        this.mAdapter = new SmartEffectRecyclerViewAdapter(this.mContext, this.mSmartEffects);
        this.mAdapter.setItemSelectChangeListener(new SmartEffectItemSelectChangeListener());
        this.mSingleChoiceRecyclerView.setAdapter(this.mAdapter);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mSingleChoiceRecyclerView);
        this.mAdapter.setSelectedItemPosition(this.mSavedSelectedSmartEffectIndex);
    }

    /* access modifiers changed from: private */
    public void refreshData(List<VideoEditorBaseLocalResource> list) {
        List localTemplateEntities = this.mModuleFactory.getLocalTemplateEntities(this.mContext);
        if (list != null) {
            localTemplateEntities.addAll(list);
        }
        final ArrayList arrayList = new ArrayList();
        arrayList.addAll(VideoEditorDataManager.loadSmartEffects(localTemplateEntities));
        NexAssetTemplateManager.getInstance().checkExpiredAsset(new ICheckExpiredAssetListener() {
            public void onFinished(List<Template> list) {
                SmartEffectFragment.this.mSmartEffectManager.initDataWithTemplate(list, arrayList);
                ThreadManager.runOnMainThread(new Runnable() {
                    public void run() {
                        SmartEffectFragment.this.mSmartEffects.clear();
                        SmartEffectFragment.this.mSmartEffects.addAll(arrayList);
                        if (SmartEffectFragment.this.mAdapter != null) {
                            SmartEffectFragment.this.mAdapter.notifyDataSetChanged();
                        }
                    }
                });
            }
        });
    }

    /* access modifiers changed from: private */
    public void updateSelectedItemPosition(int i) {
        if (this.mAdapter != null) {
            this.mAdapter.setSelectedItemPosition(i);
            this.mAdapter.clearLastSelectedPostion();
        }
    }

    public boolean doApply() {
        if (this.mVideoEditor == null) {
            Log.d("SmartEffectFragment", "doApply: videoEditor is null.");
            return false;
        }
        this.mVideoEditor.saveEditState();
        this.mSavedSelectedSmartEffectIndex = this.mAdapter.getSelectedItemPosition();
        recordEventWithApply();
        onExitMode();
        return true;
    }

    public boolean doCancel() {
        if (this.mVideoEditor == null) {
            Log.d("SmartEffectFragment", "doCancel: videoEditor is null.");
            return false;
        }
        this.mVideoEditor.restoreEditState();
        return this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                if (SmartEffectFragment.this.mVideoEditor != null) {
                    SmartEffectFragment.this.mVideoEditor.play();
                    SmartEffectFragment.this.recordEventWithCancel();
                    SmartEffectFragment.this.onExitMode();
                }
            }
        });
    }

    public List<String> getCurrentEffect() {
        if (this.mAdapter != null) {
            SmartEffect smartEffect = this.mAdapter.getSmartEffect(this.mAdapter.getSelectedItemPosition());
            if (smartEffect != null) {
                return Arrays.asList(new String[]{smartEffect.getLabel()});
            }
        }
        return null;
    }

    public int getEffectId() {
        return R.id.video_editor_smart_effect;
    }

    public boolean isHighFrames() {
        boolean z = false;
        if (this.mVideoEditor == null) {
            return false;
        }
        if (this.mVideoEditor.getVideoFrames() >= 100) {
            z = true;
        }
        return z;
    }

    public void loadResourceData() {
        this.mModuleFactory = new SmartEffectFactory();
        this.mVideoEditorResourceRequest = new VideoEditorResourceRequest(getEffectId(), this.mModuleFactory);
        this.mVideoEditorResourceRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                SmartEffectFragment.this.refreshData(objArr[0]);
            }

            public void onResponseError(final ErrorCode errorCode, String str, Object obj) {
                Log.d("SmartEffectFragment", "errorCode: %s", (Object) errorCode);
                ThreadManager.runOnMainThread(new Runnable() {
                    public void run() {
                        if (SmartEffectFragment.this.mSmartEffects != null && SmartEffectFragment.this.mSmartEffects.size() == 0) {
                            SmartEffectFragment.this.mSmartEffects.add(new SmartEffect("smart_effect_none", R.drawable.video_editor_icon_smart_effect_none, "ve_type_none", false));
                            if (SmartEffectFragment.this.mAdapter != null) {
                                SmartEffectFragment.this.mAdapter.notifyDataSetChanged();
                            }
                        }
                        if (errorCode == ErrorCode.NETWORK_NOT_CONNECTED) {
                            ThreadManager.runOnMainThread(new Runnable() {
                                public void run() {
                                    ToastUtils.makeText(SmartEffectFragment.this.mContext, (int) R.string.video_editor_download_failed_for_notwork);
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

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mSmartEffectManager = new SmartEffectManager();
        loadResourceData();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mLayout = new SmartEffectView(viewGroup.getContext());
        this.mCancelView = this.mLayout.findViewById(R.id.cancel);
        this.mOkView = this.mLayout.findViewById(R.id.ok);
        this.mTitleView = (TextView) this.mLayout.findViewById(R.id.title);
        this.mTitleView.setText(this.mContext.getResources().getString(R.string.video_editor_intelligent_special_effect));
        this.mVideoTotalTime = this.mVideoEditor.getProjectTotalTime();
        initRecyclerView(this.mLayout);
        initListener();
        return this.mLayout;
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mDownloadingSmartEffect != null && this.mDownloadingSmartEffect.isDownloading()) {
            this.mDownloadingSmartEffect.setDownloadState(20);
        }
        if (this.mToast != null) {
            this.mToast.cancel();
        }
        if (this.mAdapter != null) {
            this.mAdapter.setItemSelectChangeListener(null);
            this.mAdapter = null;
        }
        if (this.mVideoEditorResourceRequest != null) {
            this.mVideoEditorResourceRequest.cancel();
        }
        cancelRequest();
    }

    public void onDownlaodCompleted(VideoEditorBaseModel videoEditorBaseModel, final int i) {
        final SmartEffect smartEffect = (SmartEffect) videoEditorBaseModel;
        NexAssetTemplateManager.getInstance().installSmartEffectAssetPackageToSdk(smartEffect.getAssetId(), new ILoadAssetTemplate() {
            public void onFail() {
                smartEffect.setDownloadState(20);
                SmartEffectFragment.this.notifyDateSetChanged(i);
            }

            public void onSuccess() {
                NexAssetTemplateManager.getInstance().loadSmartEffectTemplateList(new ILoadSmartEffectListener() {
                    public void onFinished(final List<Template> list) {
                        ThreadManager.runOnMainThread(new Runnable() {
                            public void run() {
                                SmartEffectFragment.this.mSmartEffectManager.updateDataWithTemplate(list, smartEffect);
                                SmartEffectFragment.this.notifyDateSetChanged(i);
                            }
                        });
                    }
                });
            }
        });
    }
}
