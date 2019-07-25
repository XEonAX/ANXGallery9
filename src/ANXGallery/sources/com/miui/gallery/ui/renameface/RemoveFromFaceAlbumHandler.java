package com.miui.gallery.ui.renameface;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceAlbumHandlerListener;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceFolderItemImpl;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceNewFolerItem;
import com.miui.gallery.ui.renameface.PeopleFaceMergeDialogFragment.PeopleSelectListener;
import miui.app.AlertDialog.Builder;

public class RemoveFromFaceAlbumHandler extends FaceAlbumHandlerBase {
    public RemoveFromFaceAlbumHandler(Activity activity, NormalPeopleFaceMediaSet normalPeopleFaceMediaSet, FaceAlbumHandlerListener faceAlbumHandlerListener) {
        super(activity, normalPeopleFaceMediaSet, faceAlbumHandlerListener);
    }

    public void finishWhenGetContact(PeopleContactInfo peopleContactInfo) {
        if (peopleContactInfo != null && !TextUtils.isEmpty(peopleContactInfo.name) && this.mListener != null) {
            FaceNewFolerItem faceNewFolerItem = new FaceNewFolerItem(peopleContactInfo.name);
            faceNewFolerItem.setContactjson(peopleContactInfo.formatContactJson());
            this.mListener.onGetFolderItem(faceNewFolerItem);
        }
    }

    public void show() {
        new Builder(this.mActivity).setSingleChoiceItems(new String[]{this.mActivity.getString(R.string.remove_from_current_album), this.mActivity.getString(R.string.remove_to_other_album), this.mActivity.getString(17039360)}, -1, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
                switch (i) {
                    case 0:
                        if (RemoveFromFaceAlbumHandler.this.mListener != null) {
                            RemoveFromFaceAlbumHandler.this.mListener.onGetFolderItem(null);
                            return;
                        }
                        return;
                    case 1:
                        RemoveFromFaceAlbumHandler.this.showRemoveDialog();
                        return;
                    case 2:
                        dialogInterface.cancel();
                        return;
                    default:
                        StringBuilder sb = new StringBuilder();
                        sb.append("unknown item clicked: ");
                        sb.append(i);
                        throw new IllegalStateException(sb.toString());
                }
            }
        }).create().show();
    }

    public void showRemoveDialog() {
        final PeopleFaceMergeDialogFragment peopleFaceMergeDialogFragment = new PeopleFaceMergeDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putString("people_face_Merge_title", this.mActivity.getString(R.string.remove_to_album_title));
        bundle.putParcelable("merge_action_from_album", this.mFaceSet);
        peopleFaceMergeDialogFragment.setArguments(bundle);
        peopleFaceMergeDialogFragment.showAllowingStateLoss(this.mActivity.getFragmentManager(), "PeopleFaceMergeDialogFragment");
        peopleFaceMergeDialogFragment.setPeopleSelectListener(new PeopleSelectListener() {
            public void onPeopleSelect(FaceDisplayFolderItem faceDisplayFolderItem, boolean z, int i) {
                if (i == 0) {
                    RemoveFromFaceAlbumHandler.this.showInputFolderNameDialog(17, null, false);
                } else if (RemoveFromFaceAlbumHandler.this.mListener != null) {
                    RemoveFromFaceAlbumHandler.this.mListener.onGetFolderItem(new FaceFolderItemImpl(faceDisplayFolderItem));
                }
                peopleFaceMergeDialogFragment.dismiss();
            }
        });
    }
}
