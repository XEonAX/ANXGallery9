package com.miui.gallery.ui;

import android.app.Fragment;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.picker.PickGalleryActivity;
import com.miui.gallery.ui.CopyOrMoveDialog.OnOperationSelectedListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.HashMap;

public class AddPhotosFragment extends Fragment {
    /* access modifiers changed from: private */
    public long mAlbumId;

    public static void addPhotos(Fragment fragment, long j) {
        FragmentTransaction beginTransaction = fragment.getChildFragmentManager().beginTransaction();
        AddPhotosFragment addPhotosFragment = new AddPhotosFragment();
        Bundle bundle = new Bundle();
        bundle.putLong("key_album_id", j);
        addPhotosFragment.setArguments(bundle);
        beginTransaction.add(addPhotosFragment, "AddPhotosFragment");
        beginTransaction.commitAllowingStateLoss();
    }

    private void doAddPhotos(final long[] jArr) {
        Fragment parentFragment = getParentFragment();
        if (parentFragment != null) {
            CopyOrMoveDialog copyOrMoveDialog = new CopyOrMoveDialog();
            copyOrMoveDialog.setOnOperationSelectedListener(new OnOperationSelectedListener() {
                public void onOperationSelected(int i) {
                    Fragment parentFragment = AddPhotosFragment.this.getParentFragment();
                    if (parentFragment != null && parentFragment.getActivity() != null) {
                        switch (i) {
                            case 1:
                                CopyMoveDialogFragment.show(parentFragment.getActivity(), AddPhotosFragment.this.mAlbumId, jArr, 0, false, null);
                                AddPhotosFragment.this.recordCopyMoveAction(false);
                                return;
                            case 2:
                                return;
                            default:
                                CopyMoveDialogFragment.show(parentFragment.getActivity(), AddPhotosFragment.this.mAlbumId, jArr, 0, true, null);
                                AddPhotosFragment.this.recordCopyMoveAction(true);
                                return;
                        }
                    }
                }
            });
            copyOrMoveDialog.showAllowingStateLoss(parentFragment.getFragmentManager(), "CopyOrMoveDialog");
            return;
        }
        Log.e("AddPhotosFragment", "Add photo show CopyOrMoveDialog fail,Do copy operation for default!");
        recordCopyMoveAction(false);
    }

    private void pickPhotos() {
        Intent intent = new Intent(getActivity(), PickGalleryActivity.class);
        intent.putExtra("pick-upper-bound", -1);
        intent.putExtra("pick-need-id", true);
        startActivityForResult(intent, 7);
    }

    /* access modifiers changed from: private */
    public void recordCopyMoveAction(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("move", String.valueOf(z));
        hashMap.put("from", "AddPhotosFragment");
        GallerySamplingStatHelper.recordCountEvent("organize_photos", "move_or_copy", hashMap);
    }

    private void setResult(int i) {
        Fragment parentFragment = getParentFragment();
        if (parentFragment != null) {
            parentFragment.onActivityResult(33, i, getArguments() != null ? new Intent().putExtras(getArguments()) : null);
        }
        getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Bundle arguments = getArguments();
        this.mAlbumId = arguments != null ? arguments.getLong("key_album_id", 0) : 0;
        if (this.mAlbumId == 0) {
            setResult(0);
        } else {
            pickPhotos();
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 != -1 || intent == null) {
            setResult(0);
        } else {
            ArrayList arrayList = (ArrayList) intent.getSerializableExtra("pick-result-data");
            if (arrayList == null || arrayList.isEmpty()) {
                setResult(0);
                return;
            }
            long[] jArr = new long[arrayList.size()];
            for (int i3 = 0; i3 < arrayList.size(); i3++) {
                jArr[i3] = ((Long) arrayList.get(i3)).longValue();
            }
            doAddPhotos(jArr);
            setResult(-1);
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new View(getActivity());
    }
}
