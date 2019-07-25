package com.miui.gallery.ui;

import android.app.Fragment;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.projection.ConnectController;
import com.miui.gallery.projection.ProjectionVideoController;
import com.miui.gallery.projection.ProjectionVideoController.OnFinishListener;
import com.miui.gallery.util.FileUtils;

public class ProjectVideoFragment extends Fragment implements OnFinishListener {
    private ProjectionVideoController mRemoteVideoControl;

    private void setResult() {
        Fragment targetFragment = getTargetFragment();
        if (targetFragment != null) {
            targetFragment.onActivityResult(25, -1, null);
        }
    }

    public static void showProjectVideoFragment(BaseActivity baseActivity, BaseDataItem baseDataItem) {
        ProjectVideoFragment projectVideoFragment = new ProjectVideoFragment();
        Bundle bundle = new Bundle();
        bundle.putSerializable("photo_data_item", baseDataItem);
        projectVideoFragment.setArguments(bundle);
        baseActivity.startFragment(projectVideoFragment, null, true, true);
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        BaseDataItem baseDataItem = (BaseDataItem) getArguments().getSerializable("photo_data_item");
        String originalPath = baseDataItem.getOriginalPath();
        this.mRemoteVideoControl.startPlay(originalPath, TextUtils.isEmpty(baseDataItem.getTitle()) ? FileUtils.getFileTitle(FileUtils.getFileName(originalPath)) : baseDataItem.getTitle(), ConnectController.getInstance().getCurConnectedDevice());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mRemoteVideoControl = (ProjectionVideoController) layoutInflater.inflate(R.layout.projection_video, viewGroup, false);
        this.mRemoteVideoControl.initView();
        return this.mRemoteVideoControl;
    }

    public void onDestroy() {
        setResult();
        super.onDestroy();
    }

    public void onFinish() {
        if (isResumed() && getActivity().getFragmentManager().getBackStackEntryCount() > 0) {
            getActivity().getFragmentManager().popBackStack();
        }
    }

    public void onPause() {
        this.mRemoteVideoControl.setOnFinishListener(null);
        super.onPause();
    }

    public void onResume() {
        super.onResume();
        this.mRemoteVideoControl.setOnFinishListener(this);
    }
}
