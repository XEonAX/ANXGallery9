package com.miui.gallery.ui;

import android.app.Dialog;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.MergeCursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.BaseAdapter;
import com.miui.gallery.model.AlbumConstants;
import com.miui.gallery.preference.GalleryPreferences;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.ui.BaseAlbumOperationDialogFragment.OnAlbumOperationDoneListener;
import com.miui.gallery.ui.CopyOrMoveDialog.OnOperationSelectedListener;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.CursorUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.GalleryDialogFragment;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class AddToAlbumDialogFragment extends GalleryDialogFragment {
    public static final String[] PROJECTION;
    private LoaderCallbacks<Cursor> mCallbacks = new LoaderCallbacks<Cursor>() {
        public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(AddToAlbumDialogFragment.this.getActivity());
            if (i == 1) {
                cursorLoader.setUri(AddToAlbumDialogFragment.this.getLoadUri());
                cursorLoader.setProjection(AddToAlbumDialogFragment.PROJECTION);
                cursorLoader.setSelection(AddToAlbumDialogFragment.this.getSelection());
                cursorLoader.setSortOrder("classification ASC, sortBy ASC ");
                return cursorLoader;
            }
            cursorLoader.setUri(Album.URI_SHARE_ALL);
            cursorLoader.setProjection(AlbumConstants.SHARED_ALBUM_PROJECTION);
            cursorLoader.setSelection("count > 0");
            return cursorLoader;
        }

        /* JADX WARNING: type inference failed for: r3v0, types: [android.database.MergeCursor] */
        /* JADX WARNING: Multi-variable type inference failed */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
            if (loader.getId() == 1) {
                MatrixCursor matrixCursor = new MatrixCursor(cursor.getColumnNames());
                matrixCursor.addRow(AddToAlbumDialogFragment.this.mCreatePlaceHolder);
                if (AddToAlbumDialogFragment.this.showSecretAlbum()) {
                    matrixCursor.addRow(AddToAlbumDialogFragment.this.mSecretPlaceHolder);
                }
                Cursor access$600 = AddToAlbumDialogFragment.this.mListAdapter.sortCursor(cursor);
                AlbumSelectorAdapter access$500 = AddToAlbumDialogFragment.this.mListAdapter;
                if (access$600 != null) {
                    matrixCursor = new MergeCursor(new Cursor[]{matrixCursor, access$600});
                }
                access$500.swapCursor(matrixCursor);
            } else if (loader.getId() == 2) {
                AddToAlbumDialogFragment.this.mListAdapter.setSharedAlbums(cursor);
            }
        }

        public void onLoaderReset(Loader<Cursor> loader) {
        }
    };
    /* access modifiers changed from: private */
    public Object[] mCreatePlaceHolder;
    private AlertDialog mDialog;
    /* access modifiers changed from: private */
    public AlbumSelectorAdapter mListAdapter;
    /* access modifiers changed from: private */
    public OnAlbumSelectedListener mListener;
    /* access modifiers changed from: private */
    public OnAlbumOperationDoneListener mOnAlbumCreatedListener = new OnAlbumOperationDoneListener() {
        public void onOperationDone(long j, String str) {
            if (j > 0) {
                AddToAlbumDialogFragment.this.onAlbumSelected(j, AddToAlbumDialogFragment.this.showCopyOrMove());
            }
        }
    };
    /* access modifiers changed from: private */
    public Object[] mSecretPlaceHolder;

    private class AlbumSelectorAdapter extends BaseAdapter implements OnClickListener {
        private Map<String, ShareAlbum> mSharedAlbums;

        public class ShareAlbum {
            String mAlbumId;
            String mCreatorId;
            String mOwnerNickName;
            int mUserCount;

            public ShareAlbum() {
            }

            public String getOwnerName() {
                return TextUtils.isEmpty(this.mOwnerNickName) ? this.mCreatorId : this.mOwnerNickName;
            }
        }

        public AlbumSelectorAdapter(Context context) {
            super(context);
        }

        private void bindImage(int i, ImageView imageView) {
            BindImageHelper.bindImage(getLocalPath(i), getDownloadUri(i), DownloadType.MICRO, imageView, getDisplayImageOptions(i), ThumbConfig.get().sMicroTargetSize);
        }

        private String getAlbumName(Cursor cursor) {
            return isCameraAlbum(cursor) ? AddToAlbumDialogFragment.this.getString(R.string.album_camera_name) : isScreenshotsAlbum(cursor) ? AddToAlbumDialogFragment.this.getString(R.string.album_screenshot_name) : cursor.getString(5);
        }

        private ShareAlbum getShareAlbumInfo(int i) {
            int i2 = getCursorByPosition(i).getInt(0);
            if (this.mSharedAlbums != null) {
                return (ShareAlbum) this.mSharedAlbums.get(String.valueOf(i2));
            }
            return null;
        }

        private boolean isBabyAlbum(Cursor cursor) {
            return !TextUtils.isEmpty(cursor.getString(8));
        }

        private boolean isCameraAlbum(Cursor cursor) {
            return String.valueOf(1).equals(cursor.getString(10));
        }

        private boolean isForceTypeTime(Cursor cursor) {
            return GalleryPreferences.Album.isForceTopAlbumByTopTime(cursor.getLong(9));
        }

        private boolean isOtherShareAlbum(Cursor cursor) {
            return ShareAlbumManager.isOtherShareAlbumId((long) cursor.getInt(0));
        }

        private boolean isOwnerShareAlbum(Cursor cursor) {
            return !isOtherShareAlbum(cursor) && this.mSharedAlbums != null && this.mSharedAlbums.containsKey(String.valueOf(cursor.getInt(0)));
        }

        private boolean isScreenshotsAlbum(Cursor cursor) {
            return String.valueOf(2).equals(cursor.getString(10));
        }

        private boolean isSystemAlbum(Cursor cursor) {
            String string = cursor.getString(10);
            for (Long valueOf : Album.ALL_SYSTEM_ALBUM_SERVER_IDS) {
                if (String.valueOf(valueOf).equals(string)) {
                    return true;
                }
            }
            return false;
        }

        /* access modifiers changed from: private */
        public Cursor sortCursor(Cursor cursor) {
            if (cursor == null || cursor.isClosed()) {
                return null;
            }
            if (cursor.getCount() <= 0 || !cursor.moveToFirst()) {
                return cursor;
            }
            MatrixCursor matrixCursor = new MatrixCursor(AddToAlbumDialogFragment.PROJECTION);
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList();
            ArrayList arrayList4 = new ArrayList();
            ArrayList<Integer> arrayList5 = new ArrayList<>();
            Object[] objArr = new Object[AddToAlbumDialogFragment.PROJECTION.length];
            int i = cursor.getInt(11);
            while (!cursor.isAfterLast()) {
                int i2 = cursor.getInt(11);
                if (i2 != i) {
                    arrayList5.addAll(arrayList);
                    arrayList.clear();
                    arrayList5.addAll(arrayList2);
                    arrayList2.clear();
                    arrayList5.addAll(arrayList3);
                    arrayList3.clear();
                    arrayList5.addAll(arrayList4);
                    arrayList4.clear();
                    i = i2;
                }
                if (isForceTypeTime(cursor)) {
                    arrayList.add(Integer.valueOf(cursor.getPosition()));
                } else if (isSystemAlbum(cursor)) {
                    arrayList2.add(Integer.valueOf(cursor.getPosition()));
                } else if (isBabyAlbum(cursor)) {
                    arrayList3.add(Integer.valueOf(cursor.getPosition()));
                } else {
                    arrayList4.add(Integer.valueOf(cursor.getPosition()));
                }
                cursor.moveToNext();
            }
            arrayList5.addAll(arrayList);
            arrayList5.addAll(arrayList2);
            arrayList5.addAll(arrayList3);
            arrayList5.addAll(arrayList4);
            for (Integer intValue : arrayList5) {
                cursor.moveToPosition(intValue.intValue());
                CursorUtils.addRowToMatrixCursor(cursor, matrixCursor, objArr);
            }
            MiscUtil.closeSilently(cursor);
            return matrixCursor;
        }

        public void bindView(View view, Context context, Cursor cursor) {
            int position = cursor.getPosition();
            ImageView imageView = (ImageView) view.findViewById(R.id.cover);
            TextView textView = (TextView) view.findViewById(R.id.title);
            TextView textView2 = (TextView) view.findViewById(R.id.count);
            TextView textView3 = (TextView) view.findViewById(R.id.type);
            view.setTag(Integer.valueOf(position));
            String str = null;
            if (cursor.getInt(7) == 0) {
                ImageLoader.getInstance().cancelDisplayTask(imageView);
                imageView.setImageDrawable(context.getResources().getDrawable(R.drawable.create_album));
                textView2.setVisibility(8);
            } else if (cursor.getInt(7) == 2) {
                ImageLoader.getInstance().cancelDisplayTask(imageView);
                imageView.setImageDrawable(context.getResources().getDrawable(R.drawable.secret_album));
                textView2.setVisibility(8);
            } else {
                imageView.setImageDrawable(null);
                textView2.setVisibility(0);
                int i = cursor.getInt(6);
                textView2.setText(String.format(context.getResources().getQuantityText(R.plurals.album_count, i).toString(), new Object[]{Integer.valueOf(i)}));
                bindImage(position, imageView);
            }
            textView.setText(getAlbumName(cursor));
            if (isOtherShareAlbum(cursor)) {
                ShareAlbum shareAlbumInfo = getShareAlbumInfo(position);
                if (shareAlbumInfo != null && !TextUtils.isEmpty(shareAlbumInfo.getOwnerName())) {
                    if (isBabyAlbum(cursor)) {
                        str = context.getString(R.string.album_others_share_baby_info_format, new Object[]{shareAlbumInfo.getOwnerName()});
                    } else {
                        str = context.getString(R.string.album_others_share_info_format, new Object[]{shareAlbumInfo.getOwnerName()});
                    }
                }
            } else if (isBabyAlbum(cursor)) {
                str = context.getString(R.string.album_type_baby);
            } else if (isOwnerShareAlbum(cursor)) {
                ShareAlbum shareAlbumInfo2 = getShareAlbumInfo(position);
                if (shareAlbumInfo2 != null) {
                    str = context.getResources().getQuantityString(R.plurals.album_already_share_user_count, shareAlbumInfo2.mUserCount, new Object[]{Integer.valueOf(shareAlbumInfo2.mUserCount)});
                }
            }
            if (TextUtils.isEmpty(str)) {
                textView3.setVisibility(8);
                return;
            }
            textView3.setVisibility(0);
            textView3.setText(str);
        }

        public Uri getDownloadUri(int i) {
            return getDownloadUri(getCursorByPosition(i), 4, 1);
        }

        public long getFileLength(int i) {
            return getCursorByPosition(i).getLong(12);
        }

        public String getLocalPath(int i) {
            return getMicroPath(getCursorByPosition(i), 2, 3);
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
            View inflate = LayoutInflater.from(context).inflate(R.layout.album_selector_item, viewGroup, false);
            inflate.setOnClickListener(this);
            return inflate;
        }

        public void onClick(View view) {
            int intValue = ((Integer) view.getTag()).intValue();
            Cursor cursor = AddToAlbumDialogFragment.this.mListAdapter.getCursor();
            cursor.moveToPosition(intValue);
            if (cursor.getInt(7) == 0) {
                AlbumCreatorDialogFragment albumCreatorDialogFragment = new AlbumCreatorDialogFragment();
                albumCreatorDialogFragment.setOnAlbumOperationDoneListener(AddToAlbumDialogFragment.this.mOnAlbumCreatedListener);
                albumCreatorDialogFragment.showAllowingStateLoss(AddToAlbumDialogFragment.this.getFragmentManager(), "AlbumCreatorDialogFragment");
                GallerySamplingStatHelper.recordCountEvent("add_to_dialog", "add_to_new_album");
            } else if (cursor.getInt(7) == 2) {
                AddToAlbumDialogFragment.this.onAlbumSelected(AddToAlbumDialogFragment.this.mListAdapter.getItemId(intValue), false);
                GallerySamplingStatHelper.recordCountEvent("add_to_dialog", "add_to_secret");
            } else {
                AddToAlbumDialogFragment.this.onAlbumSelected(AddToAlbumDialogFragment.this.mListAdapter.getItemId(intValue), AddToAlbumDialogFragment.this.showCopyOrMove());
            }
        }

        public void setSharedAlbums(Cursor cursor) {
            if (cursor != null) {
                while (cursor.moveToNext()) {
                    try {
                        ShareAlbum shareAlbum = new ShareAlbum();
                        shareAlbum.mAlbumId = cursor.getString(0);
                        shareAlbum.mCreatorId = cursor.getString(1);
                        shareAlbum.mUserCount = cursor.getInt(2);
                        shareAlbum.mOwnerNickName = cursor.getString(3);
                        if (this.mSharedAlbums == null) {
                            this.mSharedAlbums = new HashMap();
                        }
                        this.mSharedAlbums.put(shareAlbum.mAlbumId, shareAlbum);
                    } finally {
                        cursor.close();
                    }
                }
                if (getCount() > 0) {
                    notifyDataSetChanged();
                }
            }
        }
    }

    public interface OnAlbumSelectedListener {
        void onAlbumSelected(long j, boolean z);
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(Cloud.ALIAS_ALBUM_CLASSIFICATION);
        sb.append(" AS ");
        sb.append("classification");
        PROJECTION = new String[]{"_id AS _id", "cover_id", "cover_path", "cover_sha1", "cover_sync_state", "name", "media_count", "1 AS TYPE", "baby_info", "sortBy", "serverId", sb.toString(), "cover_size"};
    }

    /* access modifiers changed from: private */
    public Uri getLoadUri() {
        return getArguments() != null ? Album.URI.buildUpon().appendQueryParameter("join_share", String.valueOf(getArguments().getBoolean("show_share_album", true))).build() : Album.URI;
    }

    /* access modifiers changed from: private */
    public String getSelection() {
        boolean z;
        Bundle arguments = getArguments();
        boolean z2 = true;
        if (arguments != null) {
            if (arguments.containsKey("show_system_album")) {
                z2 = arguments.getBoolean("show_system_album");
            }
            z = arguments.getBoolean("show_immutable_album");
        } else {
            z = false;
        }
        String str = Cloud.ALIAS_NON_SYSTEM_ALBUM;
        String str2 = "immutable = 0";
        String str3 = isOnlyShowLocal() ? " AND (media_count>0)" : "";
        if (!z2 && !z) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" AND ");
            sb.append(str2);
            sb.append(str3);
            return sb.toString();
        } else if (!z2) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(str3);
            return sb2.toString();
        } else if (z) {
            return null;
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str2);
            sb3.append(str3);
            return sb3.toString();
        }
    }

    private boolean isOnlyShowLocal() {
        return LocalMode.isOnlyShowLocalPhoto();
    }

    /* access modifiers changed from: private */
    public void onAlbumSelected(long j, boolean z) {
        if (z && ShareMediaManager.isOtherShareMediaId(j)) {
            Log.d("AddToAlbumDialogFragment", "Is other shared album, do copy operation for default");
            z = false;
        }
        if (z) {
            showCopyOrMoveDialog(j);
            return;
        }
        dismissSafely();
        if (this.mListener != null) {
            this.mListener.onAlbumSelected(j, false);
        }
    }

    /* access modifiers changed from: private */
    public void recordCopyMoveAction(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("move", String.valueOf(z));
        hashMap.put("from", "AddToAlbumDialogFragment");
        GallerySamplingStatHelper.recordCountEvent("organize_photos", "move_or_copy", hashMap);
    }

    /* access modifiers changed from: private */
    public boolean showCopyOrMove() {
        return getArguments() == null || getArguments().getBoolean("show_copy_or_move");
    }

    private void showCopyOrMoveDialog(final long j) {
        CopyOrMoveDialog copyOrMoveDialog = new CopyOrMoveDialog();
        copyOrMoveDialog.setOnOperationSelectedListener(new OnOperationSelectedListener() {
            public void onOperationSelected(int i) {
                switch (i) {
                    case 1:
                        if (AddToAlbumDialogFragment.this.mListener != null) {
                            AddToAlbumDialogFragment.this.mListener.onAlbumSelected(j, false);
                        }
                        AddToAlbumDialogFragment.this.recordCopyMoveAction(false);
                        return;
                    case 2:
                        return;
                    default:
                        if (AddToAlbumDialogFragment.this.mListener != null) {
                            AddToAlbumDialogFragment.this.mListener.onAlbumSelected(j, true);
                        }
                        AddToAlbumDialogFragment.this.recordCopyMoveAction(true);
                        return;
                }
            }
        });
        copyOrMoveDialog.showAllowingStateLoss(getFragmentManager(), "CopyOrMoveDialog");
        dismissSafely();
    }

    /* access modifiers changed from: private */
    public boolean showSecretAlbum() {
        return getArguments() == null || getArguments().getBoolean("show_add_secret");
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        getLoaderManager().initLoader(1, getArguments(), this.mCallbacks);
        getLoaderManager().initLoader(2, getArguments(), this.mCallbacks);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mCreatePlaceHolder = new Object[]{Integer.valueOf(-1), Integer.valueOf(-1), null, null, Integer.valueOf(0), getString(R.string.create_new_album), Integer.valueOf(0), Integer.valueOf(0), null, Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(-1), Integer.valueOf(0)};
        this.mSecretPlaceHolder = new Object[]{Long.valueOf(-1000), Integer.valueOf(-1), null, null, Integer.valueOf(0), getString(R.string.secret_album_display_name), Integer.valueOf(0), Integer.valueOf(2), null, Integer.valueOf(0), Long.valueOf(1000), Integer.valueOf(-1), Integer.valueOf(0)};
        this.mListAdapter = new AlbumSelectorAdapter(getActivity());
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Builder builder = new Builder(getActivity());
        builder.setAdapter(this.mListAdapter, null).setTitle(R.string.add_to_album).setNegativeButton(17039360, null);
        this.mDialog = builder.create();
        return this.mDialog;
    }

    public void onDestroy() {
        if (this.mListAdapter != null) {
            this.mListAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public void setOnAlbumSelectedListener(OnAlbumSelectedListener onAlbumSelectedListener) {
        this.mListener = onAlbumSelectedListener;
    }
}
