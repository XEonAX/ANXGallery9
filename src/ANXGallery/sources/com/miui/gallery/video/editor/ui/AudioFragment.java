package com.miui.gallery.video.editor.ui;

import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.util.ConvertFilepathUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.LocalAudio;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.adapter.AudioRecyclerViewAdapter;
import com.miui.gallery.video.editor.factory.AudioFactory;
import com.miui.gallery.video.editor.manager.VideoEditorDataManager;
import com.miui.gallery.video.editor.model.VideoEditorBaseLocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import com.miui.gallery.video.editor.net.VideoEditorResourceRequest;
import com.miui.gallery.video.editor.ui.menu.AudioView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.ItemSelectChangeListener;
import com.nexstreaming.nexeditorsdk.nexClip;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class AudioFragment extends MenuFragment {
    /* access modifiers changed from: private */
    public AudioRecyclerViewAdapter mAdapter;
    /* access modifiers changed from: private */
    public ArrayList<LocalAudio> mAudios = new ArrayList<>();
    private boolean mBgSoundEnable = true;
    private View mCancelView;
    /* access modifiers changed from: private */
    public LocalAudio mDownloadingLocalAudio;
    private LinearLayoutManager mLinearLayoutManager;
    private View mOkView;
    private int mSavedSelectedAudioIndex;
    /* access modifiers changed from: private */
    public SingleChoiceRecyclerView mSingleChoiceRecyclerView;
    private TextView mTitleView;
    private VideoEditorResourceRequest mVideoEditorResourceRequest;
    private boolean mVoiceClicked = false;

    private class MyAudioItemSelectChangeListener implements ItemSelectChangeListener {
        private MyAudioItemSelectChangeListener() {
        }

        public boolean onItemSelect(SingleChoiceRecyclerViewAdapter singleChoiceRecyclerViewAdapter, int i, boolean z) {
            if (AudioFragment.this.hasOtherItemDownloading()) {
                return false;
            }
            ScrollControlLinearLayoutManager.onItemClick(AudioFragment.this.mSingleChoiceRecyclerView, i);
            LocalAudio auido = ((AudioRecyclerViewAdapter) singleChoiceRecyclerViewAdapter).getAuido(i);
            if (auido != null) {
                if (auido.isCustom()) {
                    Intent intent = new Intent();
                    intent.setType("audio/*");
                    intent.setAction("android.intent.action.GET_CONTENT");
                    intent.setPackage("com.miui.player");
                    try {
                        AudioFragment.this.startActivityForResult(intent, 1000);
                    } catch (ActivityNotFoundException unused) {
                        Log.e("AudioFragment", "com.miui.player not found,try all picker");
                        try {
                            Intent intent2 = new Intent();
                            intent2.setType("audio/*");
                            intent2.setAction("android.intent.action.GET_CONTENT");
                            AudioFragment.this.startActivityForResult(intent2, 1000);
                        } catch (ActivityNotFoundException unused2) {
                            Log.e("AudioFragment", "picker not found");
                        }
                    }
                    AudioFragment.this.updateSelectedItemPosition(i);
                    return false;
                } else if (auido.isNone() && z) {
                    AudioFragment.this.updateSelectedItemPosition(i);
                    AudioFragment.this.successProcess(auido);
                } else if (auido.isExtra() && z) {
                    if (auido.isDownloaded()) {
                        AudioFragment.this.updateSelectedItemPosition(i);
                        AudioFragment.this.successProcess(auido);
                    } else {
                        AudioFragment.this.mIDownloadListener.downloadResourceWithCheck(auido, i);
                        AudioFragment.this.mDownloadingLocalAudio = auido;
                    }
                }
            }
            return false;
        }
    }

    /* access modifiers changed from: private */
    public boolean hasOtherItemDownloading() {
        if (this.mAudios != null && this.mAudios.size() > 0) {
            Iterator it = this.mAudios.iterator();
            while (it.hasNext()) {
                LocalAudio localAudio = (LocalAudio) it.next();
                if (localAudio != null && localAudio.isDownloading()) {
                    return true;
                }
            }
        }
        return false;
    }

    private void initListener() {
        this.mOkView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                AudioFragment.this.doApply();
            }
        });
        this.mCancelView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                AudioFragment.this.doCancel();
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
        this.mAdapter = new AudioRecyclerViewAdapter(this.mContext, this.mAudios);
        this.mAdapter.setItemSelectChangeListener(new MyAudioItemSelectChangeListener());
        this.mSingleChoiceRecyclerView.setAdapter(this.mAdapter);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mSingleChoiceRecyclerView);
        this.mAdapter.setSelectedItemPosition(this.mSavedSelectedAudioIndex);
    }

    /* access modifiers changed from: private */
    public void refreshData(List<VideoEditorBaseLocalResource> list) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        for (VideoEditorBaseLocalResource videoEditorBaseLocalResource : list) {
            if (videoEditorBaseLocalResource != null) {
                if ("ve_type_none".equals(videoEditorBaseLocalResource.type)) {
                    arrayList.add(videoEditorBaseLocalResource);
                } else if ("ve_type_extra".equals(videoEditorBaseLocalResource.type)) {
                    arrayList2.add(videoEditorBaseLocalResource);
                } else if ("ve_type_custom".equals(videoEditorBaseLocalResource.type)) {
                    arrayList3.add(videoEditorBaseLocalResource);
                }
            }
        }
        List localTemplateEntities = this.mModuleFactory.getLocalTemplateEntities(this.mContext);
        if (list != null) {
            localTemplateEntities.addAll(arrayList);
            localTemplateEntities.addAll(arrayList2);
            localTemplateEntities.addAll(arrayList3);
        }
        final ArrayList arrayList4 = new ArrayList();
        arrayList4.addAll(VideoEditorDataManager.loadAudioData(this.mModuleFactory, localTemplateEntities));
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                AudioFragment.this.mAudios.clear();
                AudioFragment.this.mAudios.addAll(arrayList4);
                if (AudioFragment.this.mAdapter != null) {
                    AudioFragment.this.mAdapter.notifyDataSetChanged();
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void successProcess(LocalAudio localAudio) {
        this.mVideoEditor.setBackgroundMusic(localAudio.getSrcPath());
        this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                AudioFragment.this.mVideoEditor.play();
                AudioFragment.this.recordEventWithEffectChanged();
                AudioFragment.this.updatePalyBtnView();
            }
        });
    }

    private void updateAudioVoiceView(boolean z) {
        if (this.mCallback != null) {
            this.mCallback.updateAudioVoiceView(z);
        }
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
            Log.d("AudioFragment", "doApply: videoEditor is null.");
            return false;
        }
        this.mSavedSelectedAudioIndex = this.mAdapter.getSelectedItemPosition();
        this.mVideoEditor.saveEditState();
        recordEventWithApply();
        onExitMode();
        return true;
    }

    public boolean doCancel() {
        if (this.mVideoEditor == null) {
            Log.d("AudioFragment", "doCancel: videoEditor is null.");
            return false;
        }
        if (this.mVoiceClicked) {
            this.mBgSoundEnable = !this.mBgSoundEnable;
        }
        this.mVideoEditor.restoreEditState();
        return this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                if (AudioFragment.this.mVideoEditor != null) {
                    AudioFragment.this.mVideoEditor.play();
                    AudioFragment.this.recordEventWithCancel();
                    AudioFragment.this.onExitMode();
                }
            }
        });
    }

    public List<String> getCurrentEffect() {
        if (this.mAdapter == null) {
            return null;
        }
        LocalAudio auido = this.mAdapter.getAuido(this.mAdapter.getSelectedItemPosition());
        if (auido == null) {
            return null;
        }
        if (auido.isCustom()) {
            String[] strArr = new String[2];
            strArr[0] = "custom";
            strArr[1] = this.mVideoEditor.isSourceAudioEnable() ? "source" : "mute";
            return Arrays.asList(strArr);
        } else if (!auido.isExtra()) {
            return null;
        } else {
            String[] strArr2 = new String[2];
            strArr2[0] = auido.getLabel();
            strArr2[1] = this.mVideoEditor.isSourceAudioEnable() ? "source" : "mute";
            return Arrays.asList(strArr2);
        }
    }

    public int getEffectId() {
        return R.id.video_editor_audio;
    }

    public void loadResourceData() {
        this.mModuleFactory = new AudioFactory();
        this.mVideoEditorResourceRequest = new VideoEditorResourceRequest(getEffectId(), this.mModuleFactory);
        this.mVideoEditorResourceRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                AudioFragment.this.refreshData(objArr[0]);
            }

            public void onResponseError(final ErrorCode errorCode, String str, Object obj) {
                Log.d("AudioFragment", "errorCode: %s", (Object) errorCode);
                ThreadManager.runOnMainThread(new Runnable() {
                    public void run() {
                        if (AudioFragment.this.mAudios != null && AudioFragment.this.mAudios.size() == 0) {
                            AudioFragment.this.mAudios.add(new LocalAudio("audio_none", R.drawable.video_editor_icon_audio_none, "ve_type_none", false));
                            if (AudioFragment.this.mAdapter != null) {
                                AudioFragment.this.mAdapter.notifyDataSetChanged();
                            }
                        }
                        if (errorCode == ErrorCode.NETWORK_NOT_CONNECTED) {
                            ThreadManager.runOnMainThread(new Runnable() {
                                public void run() {
                                    ToastUtils.makeText(AudioFragment.this.mContext, (int) R.string.video_editor_download_failed_for_notwork);
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

    public void onActivityResult(int i, int i2, Intent intent) {
        String str;
        super.onActivityResult(i, i2, intent);
        if (i == 1000 && i2 == -1) {
            ClipData clipData = intent.getClipData();
            if (clipData == null) {
                str = ConvertFilepathUtil.getPath(getActivity(), intent.getData());
            } else {
                str = ConvertFilepathUtil.getPath(getActivity(), clipData.getItemAt(0).getUri());
            }
            if (TextUtils.isEmpty(str)) {
                return;
            }
            if (nexClip.getSupportedClip(str) != null) {
                this.mVideoEditor.setBackgroundMusic(Scheme.FILE.wrap(str));
                this.mVideoEditor.apply(new OnCompletedListener() {
                    public void onCompleted() {
                        AudioFragment.this.mVideoEditor.play();
                        AudioFragment.this.recordEventWithEffectChanged();
                        AudioFragment.this.updatePalyBtnView();
                        if (AudioFragment.this.mAdapter != null) {
                            AudioFragment.this.updateSelectedItemPosition(AudioFragment.this.mAdapter.getItemCount() - 1);
                        }
                    }
                });
                return;
            }
            ToastUtils.makeText((Context) getActivity(), (int) R.string.video_editor_unsupport_audio_file);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        loadResourceData();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        AudioView audioView = new AudioView(viewGroup.getContext());
        initRecyclerView(audioView);
        this.mCancelView = audioView.findViewById(R.id.cancel);
        this.mOkView = audioView.findViewById(R.id.ok);
        this.mTitleView = (TextView) audioView.findViewById(R.id.title);
        this.mTitleView.setText(this.mContext.getResources().getString(R.string.video_editor_audio));
        updateAudioVoiceView(this.mBgSoundEnable);
        initListener();
        return audioView;
    }

    public void onDestroyView() {
        super.onDestroyView();
        updateAudioVoiceView(false);
        if (this.mDownloadingLocalAudio != null && this.mDownloadingLocalAudio.isDownloading()) {
            this.mDownloadingLocalAudio.setDownloadState(20);
        }
        if (this.mAdapter != null) {
            this.mAdapter.setItemSelectChangeListener(null);
            this.mAdapter = null;
        }
        if (this.mVideoEditorResourceRequest != null) {
            this.mVideoEditorResourceRequest.cancel();
        }
        this.mVoiceClicked = false;
        cancelRequest();
    }

    public void onDownlaodCompleted(VideoEditorBaseModel videoEditorBaseModel, int i) {
        videoEditorBaseModel.setDownloadState(0);
        notifyDateSetChanged(i);
    }

    public void updateVoiceState(boolean z) {
        this.mBgSoundEnable = z;
        this.mVideoEditor.setSourceAudioEnable(Boolean.valueOf(z));
        this.mVoiceClicked = true;
        this.mVideoEditor.apply(new OnCompletedListener() {
            public void onCompleted() {
                AudioFragment.this.mVideoEditor.play();
                AudioFragment.this.updatePalyBtnView();
                AudioFragment.this.recordEventWithEffectChanged();
            }
        });
    }
}
