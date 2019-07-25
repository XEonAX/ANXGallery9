package com.miui.gallery.ui;

import android.app.Activity;
import android.app.Dialog;
import android.app.Fragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.WindowManager.LayoutParams;
import com.miui.account.AccountHelper;
import com.miui.gallery.R;
import com.miui.gallery.activity.facebaby.BabyAlbumDetailActivity;
import com.miui.gallery.activity.facebaby.FacePageActivity;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.GalleryContract.RecentAlbum;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.AlbumsCursorHelper;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ShareAlbumsCursorHelper;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.ProgressDialog;

public class JumpDialogFragment extends GalleryDialogFragment {
    private Runnable mDelayVisibleRunnable = new Runnable() {
        public void run() {
            if (JumpDialogFragment.this.getActivity() != null) {
                JumpDialogFragment.this.setDialogAlpha(JumpDialogFragment.this.getDialog(), 1.0f);
            }
        }
    };
    private HandleIntentCallback mHandleIntentCallback = new HandleIntentCallback() {
        public void onHandleIntent(final Intent intent) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (JumpDialogFragment.this.getActivity() != null) {
                        if (intent != null) {
                            JumpDialogFragment.this.startActivity(intent);
                        }
                        JumpDialogFragment.this.dismissAllowingStateLoss();
                    }
                }
            });
        }

        public void onJumpFailed(Context context, final String str) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (JumpDialogFragment.this.getActivity() != null) {
                        if (!TextUtils.isEmpty(str)) {
                            ToastUtils.makeText((Context) JumpDialogFragment.this.getActivity(), (CharSequence) str);
                        }
                        JumpDialogFragment.this.dismissAllowingStateLoss();
                    }
                }
            });
        }
    };

    private class AlbumJumpHelper implements LoaderCallbacks {
        private Cursor mAlbumCursor;
        private AlbumsCursorHelper mAlbumsCursorHelper;
        private Fragment mFragment;
        private HandleIntentCallback mHandleIntentCallback;
        private Cursor mShareAlbumCursor;
        private ShareAlbumsCursorHelper mShareAlbumsCursorHelper;
        private Uri mUri;

        public AlbumJumpHelper(Fragment fragment) {
            this.mFragment = fragment;
        }

        private Intent createJumpIntent() {
            Intent intent;
            if (this.mAlbumCursor.getCount() <= 0) {
                return null;
            }
            long albumId = this.mAlbumsCursorHelper.getAlbumId(0);
            Intent shortCutIntent = getShortCutIntent(albumId);
            if (shortCutIntent == null) {
                long attributes = this.mAlbumsCursorHelper.getAttributes(albumId);
                String serverId = this.mAlbumsCursorHelper.getServerId(albumId);
                String albumName = this.mAlbumsCursorHelper.getAlbumName(albumId);
                String albumLocalPath = this.mAlbumsCursorHelper.getAlbumLocalPath(Long.valueOf(albumId));
                if (this.mAlbumsCursorHelper.isBabyAlbum(albumId)) {
                    intent = new Intent(this.mFragment.getActivity(), BabyAlbumDetailActivity.class);
                    intent.putExtra("people_id", this.mAlbumsCursorHelper.getBabyAlbumPeopleId(albumId));
                    intent.putExtra("baby_info", this.mAlbumsCursorHelper.getBabyInfo(albumId));
                    intent.putExtra("thumbnail_info_of_baby", this.mAlbumsCursorHelper.getThumbnailInfoOfBaby(albumId));
                    intent.putExtra("baby_sharer_info", this.mAlbumsCursorHelper.getBabySharerInfo(albumId));
                } else {
                    intent = new Intent("com.miui.gallery.action.VIEW_ALBUM_DETAIL");
                }
                boolean equals = String.valueOf(2).equals(serverId);
                boolean isOtherShareAlbum = this.mAlbumsCursorHelper.isOtherShareAlbum(albumId);
                boolean isOwnerShareAlbum = this.mShareAlbumsCursorHelper.isOwnerShareAlbum(albumId);
                boolean isLocalAlbum = this.mAlbumsCursorHelper.isLocalAlbum(albumId);
                intent.putExtra("other_share_album", isOtherShareAlbum);
                intent.putExtra("owner_share_album", isOwnerShareAlbum);
                intent.putExtra("is_local_album", isLocalAlbum);
                intent.putExtra("screenshot_album", equals);
                intent.putExtra("pano_album", AlbumsCursorHelper.isPanoAlbum(albumId));
                intent.putExtra("album_id", albumId);
                intent.putExtra("album_name", albumName);
                intent.putExtra("album_unwriteable", this.mAlbumsCursorHelper.albumUnwriteable(albumId));
                if (equals) {
                    String queryParameter = this.mUri.getQueryParameter("screenshotAppName");
                    if (!TextUtils.isEmpty(queryParameter)) {
                        intent.putExtra("screenshot_app_name", queryParameter);
                        intent.putExtra("album_name", queryParameter);
                        intent.putExtra("album_unwriteable", true);
                    }
                }
                intent.putExtra("album_server_id", serverId);
                intent.putExtra("attributes", attributes);
                intent.putExtra("album_local_path", albumLocalPath);
                shortCutIntent = intent;
            }
            return shortCutIntent;
        }

        private Intent getShortCutIntent(long j) {
            if (AlbumsCursorHelper.isFaceAlbum(j)) {
                return new Intent("com.miui.gallery.action.VIEW_PEOPLE");
            }
            if (!AlbumsCursorHelper.isRecentAlbum(j)) {
                return null;
            }
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(RecentAlbum.VIEW_PAGE_URI.buildUpon().appendQueryParameter("source", "album_page").build());
            intent.setPackage(this.mFragment.getActivity().getPackageName());
            return intent;
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            String str;
            CursorLoader cursorLoader = new CursorLoader(this.mFragment.getActivity());
            switch (i) {
                case 1:
                    cursorLoader.setUri(Album.URI_ALL_EXCEPT_DELETED);
                    cursorLoader.setProjection(AlbumsCursorHelper.ALL_ALBUMS_PROJECTION);
                    if (bundle.getLong("id", -1) >= 0) {
                        str = String.format("%s=%s", new Object[]{"_id", Long.valueOf(bundle.getLong("id"))});
                    } else {
                        str = String.format("%s='%s'", new Object[]{"serverId", bundle.getString("serverId")});
                    }
                    cursorLoader.setSelection(str);
                    break;
                case 2:
                    cursorLoader.setUri(Album.URI_SHARE_ALL);
                    cursorLoader.setProjection(ShareAlbumsCursorHelper.SHARED_ALBUM_PROJECTION);
                    cursorLoader.setSelection(String.format("%s>0 AND %s=%s", new Object[]{"count", "_id", Long.valueOf(bundle.getLong("id"))}));
                    break;
            }
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            switch (loader.getId()) {
                case 1:
                    this.mAlbumCursor = (Cursor) obj;
                    this.mAlbumsCursorHelper = new AlbumsCursorHelper(this.mFragment.getActivity());
                    this.mAlbumsCursorHelper.setAlbumsData(this.mAlbumCursor);
                    if (this.mAlbumCursor.moveToFirst()) {
                        Bundle bundle = new Bundle();
                        bundle.putLong("id", this.mAlbumsCursorHelper.getAlbumId(0));
                        this.mFragment.getLoaderManager().initLoader(2, bundle, this);
                        return;
                    }
                    this.mHandleIntentCallback.onJumpFailed(this.mFragment.getActivity(), this.mFragment.getString(R.string.album_jump_failed));
                    return;
                case 2:
                    this.mShareAlbumCursor = (Cursor) obj;
                    this.mShareAlbumsCursorHelper = new ShareAlbumsCursorHelper();
                    this.mShareAlbumsCursorHelper.setSharedAlbums(this.mShareAlbumCursor);
                    Intent createJumpIntent = createJumpIntent();
                    if (createJumpIntent != null) {
                        this.mHandleIntentCallback.onHandleIntent(createJumpIntent);
                        return;
                    } else {
                        this.mHandleIntentCallback.onJumpFailed(this.mFragment.getActivity(), this.mFragment.getString(R.string.album_jump_failed));
                        return;
                    }
                default:
                    return;
            }
        }

        public void onLoaderReset(Loader loader) {
            switch (loader.getId()) {
                case 1:
                    this.mAlbumsCursorHelper = null;
                    if (this.mAlbumCursor != null) {
                        this.mAlbumCursor.close();
                        return;
                    }
                    return;
                case 2:
                    this.mShareAlbumsCursorHelper = null;
                    if (this.mShareAlbumCursor != null) {
                        this.mShareAlbumCursor.close();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        public void startLoading(HandleIntentCallback handleIntentCallback, Uri uri) {
            this.mUri = uri;
            String queryParameter = this.mUri.getQueryParameter("serverId");
            String queryParameter2 = this.mUri.getQueryParameter("id");
            long longValue = !TextUtils.isEmpty(queryParameter2) ? Long.valueOf(queryParameter2).longValue() : -1;
            if (longValue >= 0 || !TextUtils.isEmpty(queryParameter)) {
                Intent shortCutIntent = getShortCutIntent(longValue);
                if (shortCutIntent != null) {
                    handleIntentCallback.onHandleIntent(shortCutIntent);
                } else {
                    this.mHandleIntentCallback = handleIntentCallback;
                    Bundle bundle = new Bundle();
                    bundle.putString("serverId", queryParameter);
                    bundle.putLong("id", longValue);
                    this.mFragment.getLoaderManager().initLoader(1, bundle, this);
                }
                return;
            }
            handleIntentCallback.onJumpFailed(this.mFragment.getActivity(), this.mFragment.getString(R.string.album_jump_failed));
        }
    }

    private interface HandleIntentCallback {
        void onHandleIntent(Intent intent);

        void onJumpFailed(Context context, String str);
    }

    private class PeopleJumpHelper implements LoaderCallbacks {
        public final String[] PROJECTION = {"_id", "peopleName", "relationType", "microthumbfile", "thumbnailFile", "localFile", "faceXScale", "faceYScale", "faceWScale", "faceHScale", "serverId"};
        private Fragment mFragment;
        private HandleIntentCallback mHandleIntentCallback;

        public PeopleJumpHelper(Fragment fragment) {
            this.mFragment = fragment;
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(this.mFragment.getActivity());
            cursorLoader.setUri(PeopleFace.PEOPLE_COVER_URI.buildUpon().appendQueryParameter("serverId", bundle.getString("serverId")).build());
            cursorLoader.setProjection(this.PROJECTION);
            return cursorLoader;
        }

        /* JADX WARNING: Removed duplicated region for block: B:24:0x00ad  */
        /* JADX WARNING: Removed duplicated region for block: B:25:0x00b3  */
        public void onLoadFinished(Loader loader, Object obj) {
            Intent intent = null;
            if (obj != null) {
                Cursor cursor = (Cursor) obj;
                try {
                    if (cursor.moveToFirst()) {
                        Bundle bundle = new Bundle();
                        String string = cursor.getString(10);
                        String string2 = cursor.getString(0);
                        bundle.putString("server_id_of_album", string);
                        bundle.putString("local_id_of_album", string2);
                        String string3 = cursor.getString(1);
                        if (TextUtils.isEmpty(string3)) {
                            string3 = this.mFragment.getString(R.string.people_page_unname);
                        }
                        bundle.putString("album_name", string3);
                        bundle.putInt("relationType", cursor.getInt(2));
                        String string4 = cursor.getString(4);
                        if (TextUtils.isEmpty(string4)) {
                            string4 = cursor.getString(3);
                        }
                        if (TextUtils.isEmpty(string4)) {
                            string4 = cursor.getString(5);
                        }
                        bundle.putString("face_album_cover", string4);
                        bundle.putParcelable("face_position_rect", new RectF(cursor.getFloat(6), cursor.getFloat(7), cursor.getFloat(6) + cursor.getFloat(8), cursor.getFloat(7) + cursor.getFloat(9)));
                        Intent intent2 = new Intent();
                        try {
                            intent2.putExtras(bundle);
                            intent2.setClass(this.mFragment.getActivity(), FacePageActivity.class);
                            intent = intent2;
                        } catch (Exception unused) {
                            intent = intent2;
                            cursor.close();
                            if (intent != null) {
                            }
                        }
                    }
                } catch (Exception unused2) {
                    cursor.close();
                    if (intent != null) {
                    }
                }
            }
            if (intent != null) {
                this.mHandleIntentCallback.onHandleIntent(intent);
            } else {
                this.mHandleIntentCallback.onJumpFailed(this.mFragment.getActivity(), this.mFragment.getString(R.string.people_jump_failed));
            }
        }

        public void onLoaderReset(Loader loader) {
        }

        public void startLoading(HandleIntentCallback handleIntentCallback, String str) {
            this.mHandleIntentCallback = handleIntentCallback;
            Bundle bundle = new Bundle();
            bundle.putString("serverId", str);
            this.mFragment.getLoaderManager().initLoader(1, bundle, this);
        }
    }

    public static void enterPrivateAlbum(Activity activity) {
        JumpDialogFragment jumpDialogFragment = new JumpDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("pageType", 2);
        jumpDialogFragment.setArguments(bundle);
        jumpDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "JumpDialogFragment");
    }

    /* access modifiers changed from: private */
    public void setDialogAlpha(Dialog dialog, float f) {
        if (dialog != null && dialog.getWindow() != null) {
            LayoutParams attributes = dialog.getWindow().getAttributes();
            attributes.alpha = f;
            dialog.getWindow().setAttributes(attributes);
        }
    }

    public static void showAlbumPage(Activity activity, Uri uri) {
        JumpDialogFragment jumpDialogFragment = new JumpDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("uri", uri);
        bundle.putInt("pageType", 0);
        jumpDialogFragment.setArguments(bundle);
        jumpDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "JumpDialogFragment");
    }

    public static void showPeoplePage(Activity activity, String str) {
        JumpDialogFragment jumpDialogFragment = new JumpDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putString("serverId", str);
        bundle.putInt("pageType", 1);
        jumpDialogFragment.setArguments(bundle);
        jumpDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "JumpDialogFragment");
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        int i = getArguments().getInt("pageType", -1);
        switch (i) {
            case 0:
                Log.d("JumpDialogFragment", "Jump to album page, album serverId = %s", (Object) getArguments().getString("serverId"));
                new AlbumJumpHelper(this).startLoading(this.mHandleIntentCallback, (Uri) getArguments().getParcelable("uri"));
                return;
            case 1:
                Log.d("JumpDialogFragment", "Jump to people page, people serverId = %s", (Object) getArguments().getString("serverId"));
                new PeopleJumpHelper(this).startLoading(this.mHandleIntentCallback, getArguments().getString("serverId"));
                return;
            case 2:
                Log.d("JumpDialogFragment", "Jump secret album");
                Bundle bundle2 = new Bundle();
                bundle2.putSerializable("cloud_guide_source", CloudGuideSource.SECRET);
                LoginAndSyncCheckFragment.checkLoginAndSyncState(this, bundle2);
                return;
            default:
                Log.e("JumpDialogFragment", "Invalid page type %d", (Object) Integer.valueOf(i));
                dismiss();
                return;
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 != -1) {
            this.mHandleIntentCallback.onHandleIntent(null);
        } else if (i != 29) {
            if (i == 36) {
                IntentUtil.enterPrivateAlbum(getActivity());
                this.mHandleIntentCallback.onHandleIntent(null);
            }
        } else if (AccountHelper.getXiaomiAccount(getActivity()) != null) {
            AuthenticatePrivacyPasswordFragment.startAuthenticatePrivacyPassword(this);
        }
        super.onActivityResult(i, i2, intent);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        ProgressDialog show = ProgressDialog.show(getActivity(), "", getActivity().getString(R.string.loading_dots), true, false);
        setDialogAlpha(show, 0.0f);
        setCancelable(false);
        return show;
    }

    public void onStart() {
        super.onStart();
        ThreadManager.getMainHandler().postDelayed(this.mDelayVisibleRunnable, (long) getResources().getInteger(17694722));
    }

    public void onStop() {
        super.onStop();
        ThreadManager.getMainHandler().removeCallbacks(this.mDelayVisibleRunnable);
    }
}
