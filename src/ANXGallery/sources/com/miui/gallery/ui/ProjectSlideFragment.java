package com.miui.gallery.ui;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;

public class ProjectSlideFragment extends Fragment {
    /* access modifiers changed from: private */
    public void setResult() {
        Fragment targetFragment = getTargetFragment();
        if (targetFragment != null && !getFragmentManager().isDestroyed()) {
            targetFragment.onActivityResult(24, -1, null);
        }
    }

    public static void showProjectSlideFragment(BaseActivity baseActivity, miui.app.Fragment fragment, String str) {
        ProjectSlideFragment projectSlideFragment = new ProjectSlideFragment();
        Bundle bundle = new Bundle();
        bundle.putString("photo_connected_device", str);
        projectSlideFragment.setArguments(bundle);
        if (fragment != null) {
            projectSlideFragment.setTargetFragment(fragment, 24);
        }
        baseActivity.startFragment(projectSlideFragment, null, true, true);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.projection_slide, viewGroup, false);
        ((TextView) inflate.findViewById(R.id.project_slide_title)).setText(getActivity().getResources().getString(R.string.projection_slide_playing, new Object[]{getArguments().getString("photo_connected_device")}));
        inflate.findViewById(R.id.project_slide_exit).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                ProjectSlideFragment.this.setResult();
                ProjectSlideFragment.this.getActivity().getFragmentManager().popBackStack();
            }
        });
        return inflate;
    }

    public void onDestroy() {
        setResult();
        super.onDestroy();
    }
}
