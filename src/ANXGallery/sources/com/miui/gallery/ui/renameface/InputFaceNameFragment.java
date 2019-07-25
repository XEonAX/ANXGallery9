package com.miui.gallery.ui.renameface;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.MergeCursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.CursorAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.model.DisplayFolderItem;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.permission.core.PermissionUtils;
import com.miui.gallery.permission.cta.CtaPermissions;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.BaseFragment;
import com.miui.gallery.ui.PeopleRelationSetDialogFragment;
import com.miui.gallery.ui.PeopleRelationSetDialogFragment.RelationSelectedListener;
import com.miui.gallery.ui.renameface.FolderItemsLoader.LoaderUpdatedItems;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.display.CircleBitmapDisplayer.CircleDrawable;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.Iterator;

public class InputFaceNameFragment extends BaseFragment {
    public static DisplayImageOptions sDisplayImageOptions = new Builder().cacheInMemory(true).considerExifParams(true).showImageForEmptyUri(R.drawable.default_face_cover).showImageOnFail(R.drawable.default_face_cover).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(false)).usingRegionDecoderFace(true).build();
    public static String[] sProjection = {Phone.CONTACT_ID, Phone.DISPLAY_NAME, Phone.NUMBER, Phone.PHOTO_URI, Phone.PHOTO_THUMBNAIL_URI};
    /* access modifiers changed from: private */
    public GetContactsInfo mGetContactInfoHelper;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler();
    /* access modifiers changed from: private */
    public boolean mInputTextChanged;
    /* access modifiers changed from: private */
    public EditText mInputView;
    /* access modifiers changed from: private */
    public boolean mIsRelationSetted;
    private ListView mListView;
    protected FolderItemsLoader mLoader;
    /* access modifiers changed from: private */
    public MergeNameAdapter mMergeAdapter;
    /* access modifiers changed from: private */
    public boolean mOnlyHasContactResult;
    /* access modifiers changed from: private */
    public boolean mOnlyUseContactAdapter;
    /* access modifiers changed from: private */
    public String mOriginalName;
    private String mOriginalSetLocalId;

    private class ContactsInfo {
        String _id;
        String coverPath;
        String displayName;
        String phoneNumber;

        private ContactsInfo() {
        }
    }

    class GetContactsInfo {
        Context context;

        public GetContactsInfo(Context context2) {
            this.context = context2;
        }

        /* access modifiers changed from: private */
        public void getContactCursor() {
            ThreadManager.getMiscPool().submit(new Job<Cursor>() {
                public Cursor run(JobContext jobContext) {
                    if (!InputFaceNameFragment.this.isAccessContactAllowed()) {
                        return null;
                    }
                    try {
                        return new MergeCursor(new Cursor[]{InputFaceNameFragment.this.getContactTipRowCursor(), GetContactsInfo.this.context.getContentResolver().query(android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI, InputFaceNameFragment.sProjection, null, null, " display_name COLLATE LOCALIZED ")});
                    } catch (IllegalArgumentException e) {
                        Log.e("InputFaceNameFragment", (Throwable) e);
                        return null;
                    }
                }
            }, new FutureListener<Cursor>() {
                public void onFutureDone(Future<Cursor> future) {
                    if (future != null) {
                        final Cursor cursor = (Cursor) future.get();
                        InputFaceNameFragment.this.mHandler.post(new Runnable() {
                            public void run() {
                                if (InputFaceNameFragment.this.mOnlyUseContactAdapter) {
                                    InputFaceNameFragment.this.mMergeAdapter.changeCursor(cursor);
                                    InputFaceNameFragment.this.mMergeAdapter.notifyDataSetChanged();
                                }
                            }
                        });
                    }
                }
            });
        }

        /* access modifiers changed from: private */
        public Cursor getSuggestionCursor(String str) {
            Uri uri;
            ContentResolver contentResolver = InputFaceNameFragment.this.mActivity.getContentResolver();
            if (InputFaceNameFragment.this.isAccessContactAllowed()) {
                uri = !TextUtils.isEmpty(str) ? Uri.withAppendedPath(android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_FILTER_URI, InputFaceNameFragment.sqlEscapeString(str.replace('/', ' '))) : android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI;
            } else {
                uri = null;
            }
            if (uri == null) {
                return null;
            }
            try {
                return contentResolver.query(uri, InputFaceNameFragment.sProjection, null, null, " display_name COLLATE LOCALIZED ");
            } catch (IllegalArgumentException e) {
                Log.e("InputFaceNameFragment", (Throwable) e);
                return null;
            }
        }
    }

    class MergeNameAdapter extends CursorAdapter {
        private int CONTECT_HEADER_VIEW = 0;
        private int NORMAL_VIEW = 1;
        private ContactsInfo mContactsInfo = new ContactsInfo();
        private LayoutInflater mInflater = null;

        private class ViewHolder {
            ImageView avartarImageView;
            TextView name;

            private ViewHolder() {
            }
        }

        public MergeNameAdapter(Context context) {
            super(context, null);
            this.mInflater = LayoutInflater.from(context);
            InputFaceNameFragment.this.mGetContactInfoHelper.getContactCursor();
        }

        private void bindHeaderView(View view, Context context, Cursor cursor) {
            View findViewById = view.findViewById(R.id.divider);
            if (InputFaceNameFragment.this.mOnlyHasContactResult) {
                InputFaceNameFragment.this.disappearView(findViewById);
            } else {
                InputFaceNameFragment.this.displayView(findViewById);
            }
        }

        private int getItemViewTypeByCursor(Cursor cursor) {
            return InputFaceNameFragment.getPhoneNumber(cursor).equalsIgnoreCase("contact") ? this.CONTECT_HEADER_VIEW : this.NORMAL_VIEW;
        }

        public void bindView(View view, Context context, Cursor cursor) {
            if (((Integer) view.getTag(R.id.tag_view_type)).intValue() == this.CONTECT_HEADER_VIEW) {
                bindHeaderView(view, context, cursor);
                return;
            }
            this.mContactsInfo._id = cursor.getString(cursor.getColumnIndex(Phone.CONTACT_ID));
            this.mContactsInfo.phoneNumber = InputFaceNameFragment.getPhoneNumber(cursor);
            this.mContactsInfo.displayName = cursor.getString(cursor.getColumnIndex(Phone.DISPLAY_NAME));
            this.mContactsInfo.coverPath = InputFaceNameFragment.getCoverPath(cursor);
            ViewHolder viewHolder = (ViewHolder) view.getTag();
            if (viewHolder == null) {
                viewHolder = new ViewHolder();
                viewHolder.name = (TextView) view.findViewById(R.id.name);
                viewHolder.avartarImageView = (ImageView) view.findViewById(R.id.folder_cover);
                view.setTag(viewHolder);
            }
            View findViewById = view.findViewById(R.id.list_divider);
            if (cursor.getPosition() == 0) {
                InputFaceNameFragment.this.disappearView(findViewById);
            } else {
                InputFaceNameFragment.this.displayView(findViewById);
            }
            viewHolder.name.setText(this.mContactsInfo.displayName);
            if (this.mContactsInfo.phoneNumber.equalsIgnoreCase("face")) {
                DisplayFolderItem access$2500 = InputFaceNameFragment.this.getDisplayItemByName(this.mContactsInfo.displayName);
                ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(access$2500.thumbnailPath), viewHolder.avartarImageView, InputFaceNameFragment.sDisplayImageOptions, (ImageSize) null, ((FaceDisplayFolderItem) access$2500).mFacePosRelative);
            } else {
                viewHolder.avartarImageView.setImageResource(R.drawable.default_face_cover);
                if (this.mContactsInfo.coverPath != null) {
                    Bitmap safeDecodeBitmap = BitmapUtils.safeDecodeBitmap(InputFaceNameFragment.this.mActivity.getContentResolver(), Uri.parse(this.mContactsInfo.coverPath));
                    if (safeDecodeBitmap != null) {
                        viewHolder.avartarImageView.setImageDrawable(new CircleDrawable(safeDecodeBitmap, Integer.valueOf(InputFaceNameFragment.this.getResources().getColor(R.color.image_stroke_color)), (float) InputFaceNameFragment.this.getResources().getDimensionPixelSize(R.dimen.image_stroke_width)));
                    }
                }
            }
        }

        public int getItemViewType(int i) {
            Cursor cursor = getCursor();
            if (cursor.moveToPosition(i)) {
                return getItemViewTypeByCursor(cursor);
            }
            return -1;
        }

        public int getViewTypeCount() {
            return 2;
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
            if (getItemViewTypeByCursor(cursor) == this.CONTECT_HEADER_VIEW) {
                View inflate = this.mInflater.inflate(R.layout.input_face_name_contact_header_item, viewGroup, false);
                inflate.setTag(R.id.tag_view_type, Integer.valueOf(this.CONTECT_HEADER_VIEW));
                return inflate;
            }
            View inflate2 = this.mInflater.inflate(R.layout.input_face_name_item, viewGroup, false);
            inflate2.setTag(R.id.tag_view_type, Integer.valueOf(this.NORMAL_VIEW));
            return inflate2;
        }
    }

    private static class Phone {
        static String CONTACT_ID = "_id";
        static String DISPLAY_NAME = "display_name";
        static String NUMBER = "data1";
        static String PHOTO_THUMBNAIL_URI = "photo_thumb_uri";
        static String PHOTO_URI = "photo_uri";
    }

    /* access modifiers changed from: private */
    public void changeMergeResultCursor(final String str) {
        ThreadManager.getMiscPool().submit(new Job<Cursor>() {
            public Cursor run(JobContext jobContext) {
                return InputFaceNameFragment.this.mGetContactInfoHelper.getSuggestionCursor(str);
            }
        }, new FutureListener<Cursor>() {
            public void onFutureDone(Future<Cursor> future) {
                Cursor[] cursorArr;
                if (future != null) {
                    Cursor cursor = (Cursor) future.get();
                    boolean z = (cursor == null || cursor.getCount() == 0) ? false : true;
                    Cursor access$1200 = InputFaceNameFragment.this.getFaceSuggest(str);
                    boolean z2 = access$1200 != null && access$1200.getCount() > 0;
                    InputFaceNameFragment.this.mOnlyHasContactResult = !z2;
                    if (z && z2) {
                        cursorArr = new Cursor[]{access$1200, InputFaceNameFragment.this.getContactTipRowCursor(), cursor};
                    } else if (z) {
                        cursorArr = new Cursor[]{InputFaceNameFragment.this.getContactTipRowCursor(), cursor};
                        MiscUtil.closeSilently(access$1200);
                    } else {
                        cursorArr = new Cursor[]{access$1200};
                        MiscUtil.closeSilently(cursor);
                    }
                    final MergeCursor mergeCursor = new MergeCursor(cursorArr);
                    InputFaceNameFragment.this.mHandler.post(new Runnable() {
                        public void run() {
                            InputFaceNameFragment.this.mMergeAdapter.changeCursor(mergeCursor);
                        }
                    });
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void disappearView(View view) {
        if (view.getVisibility() == 0) {
            view.setVisibility(8);
        }
    }

    /* access modifiers changed from: private */
    public void displayView(View view) {
        if (view.getVisibility() == 8) {
            view.setVisibility(0);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x004b  */
    public static PeopleContactInfo getContactInfo(Context context, Intent intent) {
        Throwable th;
        Cursor cursor;
        PeopleContactInfo peopleContactInfo = new PeopleContactInfo();
        if (intent.getData() != null) {
            try {
                cursor = context.getContentResolver().query(intent.getData(), null, null, null, null);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            peopleContactInfo.name = cursor.getString(cursor.getColumnIndex("display_name"));
                            peopleContactInfo.phone = getPhoneNumber(cursor);
                            peopleContactInfo.coverPath = getCoverPath(cursor);
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
                if (cursor != null) {
                    cursor.close();
                }
            } catch (Throwable th3) {
                th = th3;
                cursor = null;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        } else {
            Bundle extras = intent.getExtras();
            if (extras != null) {
                peopleContactInfo.name = extras.getString("name", "");
                peopleContactInfo.phone = extras.getString("phone", "");
                peopleContactInfo.isRepeatName = extras.getBoolean("is_repeat_name");
                if (peopleContactInfo.isRepeatName) {
                    peopleContactInfo.localGroupId = extras.getString("repeat_local_group_id", "");
                }
                peopleContactInfo.relationWithMe = extras.getString("relation_with_me", "");
                peopleContactInfo.relationWithMeText = extras.getString("relation_with_me_text", "");
            }
        }
        return peopleContactInfo;
    }

    /* access modifiers changed from: private */
    public Cursor getContactTipRowCursor() {
        MatrixCursor matrixCursor = new MatrixCursor(sProjection);
        matrixCursor.addRow(new Object[]{String.valueOf(-1), isAdded() ? getString(R.string.contact_tip) : "", "contact", null, null});
        return matrixCursor;
    }

    public static String getCoverPath(Cursor cursor) {
        try {
            String string = cursor.getString(cursor.getColumnIndex(Phone.PHOTO_URI));
            if (string == null) {
                try {
                    return cursor.getString(cursor.getColumnIndex(Phone.PHOTO_THUMBNAIL_URI));
                } catch (Exception unused) {
                }
            }
            return string;
        } catch (Exception unused2) {
            return "";
        }
    }

    /* access modifiers changed from: private */
    public DisplayFolderItem getDisplayItemByName(String str) {
        Iterator it = this.mLoader.tryToGetLoadedItems(10000).iterator();
        while (it.hasNext()) {
            DisplayFolderItem displayFolderItem = (DisplayFolderItem) it.next();
            if (displayFolderItem.name.equalsIgnoreCase(str)) {
                return displayFolderItem;
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public Cursor getFaceSuggest(String str) {
        MatrixCursor matrixCursor = new MatrixCursor(sProjection);
        String trim = str != null ? str.trim() : "";
        Iterator it = this.mLoader.tryToGetLoadedItems(10000).iterator();
        int i = 100;
        while (it.hasNext()) {
            DisplayFolderItem displayFolderItem = (DisplayFolderItem) it.next();
            if (displayFolderItem.name.toLowerCase().startsWith(trim.toLowerCase())) {
                matrixCursor.addRow(new Object[]{String.valueOf(i), displayFolderItem.name, "face", null, null});
                i++;
            }
        }
        return matrixCursor;
    }

    public static String getPhoneNumber(Cursor cursor) {
        String str;
        try {
            str = cursor.getString(cursor.getColumnIndex(Phone.NUMBER));
        } catch (Exception unused) {
            str = null;
        }
        return str == null ? "" : str;
    }

    /* access modifiers changed from: private */
    public void hideSoftKeyboard() {
        ((InputMethodManager) this.mActivity.getSystemService("input_method")).hideSoftInputFromWindow(this.mListView.getWindowToken(), 0);
    }

    private void initEditText() {
        this.mInputView.addTextChangedListener(new TextWatcher() {
            public void afterTextChanged(Editable editable) {
                InputFaceNameFragment.this.mInputTextChanged = true;
                InputFaceNameFragment.this.updateNameList();
            }

            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }
        });
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 13
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void initFaceNameLoader() {
        this.mLoader = new FaceFolderItemsLoader(this.mActivity, null, new LoaderUpdatedItems() {
            public void onLoaderUpdatedItems() {
                if (!InputFaceNameFragment.this.mOnlyUseContactAdapter) {
                    InputFaceNameFragment.this.changeMergeResultCursor(null);
                    InputFaceNameFragment.this.mMergeAdapter.notifyDataSetChanged();
                }
            }
        }, !TextUtils.isEmpty(this.mOriginalSetLocalId) ? new long[]{Long.parseLong(this.mOriginalSetLocalId)} : null);
    }

    private void initListView(View view) {
        this.mListView = (ListView) view.findViewById(R.id.list);
        this.mListView.setAdapter(this.mMergeAdapter);
        this.mListView.setOnScrollListener(new OnScrollListener() {
            public void onScroll(AbsListView absListView, int i, int i2, int i3) {
            }

            public void onScrollStateChanged(AbsListView absListView, int i) {
                if (i == 1) {
                    InputFaceNameFragment.this.hideSoftKeyboard();
                }
            }
        });
        this.mListView.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                Cursor cursor = (Cursor) InputFaceNameFragment.this.mMergeAdapter.getItem(i);
                String phoneNumber = InputFaceNameFragment.getPhoneNumber(cursor);
                if (!phoneNumber.equalsIgnoreCase("contact")) {
                    String string = cursor.getString(cursor.getColumnIndex(Phone.DISPLAY_NAME));
                    boolean access$300 = InputFaceNameFragment.this.validateIsRepeatName(string);
                    if (access$300 || !TextUtils.isEmpty(InputFaceNameFragment.this.mOriginalName) || InputFaceNameFragment.this.mOnlyUseContactAdapter || TextUtils.isEmpty(phoneNumber) || InputFaceNameFragment.this.mIsRelationSetted) {
                        InputFaceNameFragment.this.onOkClick(string, access$300, phoneNumber, null, null);
                    } else {
                        InputFaceNameFragment.this.showSetRelationDialog(string, phoneNumber);
                    }
                }
            }
        });
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 7
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    private void initMergeNameAdapter() {
        this.mGetContactInfoHelper = new GetContactsInfo(this.mActivity);
        this.mMergeAdapter = new MergeNameAdapter(this.mActivity);
    }

    private void initTitleBar() {
        View inflate = this.mActivity.getLayoutInflater().inflate(R.layout.input_face_name_activity_title, null);
        inflate.setLayoutParams(new LayoutParams(-1, -1));
        this.mActivity.getActionBar().setDisplayOptions(16, 16);
        this.mActivity.getActionBar().setCustomView(inflate);
        this.mInputView = (EditText) inflate.findViewById(R.id.autoCompleteTextView);
        if (!TextUtils.isEmpty(this.mOriginalName)) {
            this.mInputView.setText(this.mOriginalName);
            this.mInputView.selectAll();
        }
        inflate.findViewById(R.id.cancel).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                InputFaceNameFragment.this.stopFaceLoaderAndFinish();
            }
        });
        inflate.findViewById(R.id.ok).setOnClickListener(new OnClickListener() {
            /* JADX WARNING: type inference failed for: r7v17, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v17, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 33
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public void onClick(View view) {
                String obj = InputFaceNameFragment.this.mInputView.getText().toString();
                if (obj != null) {
                    obj = obj.trim();
                }
                String str = obj;
                if (TextUtils.isEmpty(str)) {
                    ToastUtils.makeText((Context) InputFaceNameFragment.this.mActivity, (CharSequence) InputFaceNameFragment.this.getString(R.string.input_or_select_a_name));
                    return;
                }
                boolean access$300 = InputFaceNameFragment.this.validateIsRepeatName(str);
                if (access$300 || !TextUtils.isEmpty(InputFaceNameFragment.this.mOriginalName) || InputFaceNameFragment.this.mOnlyUseContactAdapter || InputFaceNameFragment.this.mIsRelationSetted) {
                    InputFaceNameFragment.this.onOkClick(str, access$300, null, null, null);
                } else {
                    InputFaceNameFragment.this.showSetRelationDialog(str, null);
                }
            }
        });
    }

    /* JADX WARNING: type inference failed for: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 16
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public boolean isAccessContactAllowed() {
        boolean z;
        if (this.mActivity != null) {
            z = PermissionUtils.checkPermission((Activity) this.mActivity, "android.permission.READ_CONTACTS");
        } else {
            Log.w("InputFaceNameFragment", "Maybe have detached");
            z = false;
        }
        return !BuildUtil.isInternational() ? z & CtaPermissions.isPrivacyAllowed("android.permission.READ_CONTACTS") : z;
    }

    /* access modifiers changed from: private */
    public void onOkClick(String str, boolean z, String str2, String str3, String str4) {
        Intent intent = new Intent();
        Bundle bundle = new Bundle();
        bundle.putString("name", str);
        bundle.putBoolean("is_repeat_name", z);
        if (!TextUtils.isEmpty(str2)) {
            bundle.putString("phone", str2);
        }
        if (!TextUtils.isEmpty(str3)) {
            bundle.putString("relation_with_me", str3);
        }
        if (!TextUtils.isEmpty(str4)) {
            bundle.putString("relation_with_me_text", str4);
        }
        intent.putExtras(bundle);
        this.mActivity.setResult(-1, intent);
        hideSoftKeyboard();
        stopFaceLoaderAndFinish();
    }

    public static String sqlEscapeString(String str) {
        if (str.indexOf(39) == -1) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (charAt == '\'') {
                sb.append('\'');
            }
            sb.append(charAt);
        }
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public void stopFaceLoaderAndFinish() {
        this.mLoader.cancel();
        this.mActivity.finish();
    }

    /* access modifiers changed from: private */
    public boolean validateIsRepeatName(String str) {
        return FaceAlbumRenameHandler.getDisplayFolderItem(this.mLoader.tryToGetLoadedItems(300), str.trim()) != null;
    }

    public String getPageName() {
        return "face_input_name";
    }

    public void onBackPressed() {
        stopFaceLoaderAndFinish();
    }

    public void onDestroyView() {
        super.onDestroyView();
        hideSoftKeyboard();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onInflateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.input_face_name_fragment, viewGroup, false);
        Intent intent = this.mActivity.getIntent();
        if (!(intent == null || intent.getExtras() == null)) {
            Bundle extras = intent.getExtras();
            this.mOnlyUseContactAdapter = extras.getBoolean("only_use_contact", false);
            this.mOriginalName = extras.getString("original_name", "");
            this.mIsRelationSetted = extras.getBoolean("is_relation_setted", false);
            this.mOriginalSetLocalId = extras.getString("original_path_album_local_id", "");
        }
        this.mOnlyHasContactResult = true;
        initTitleBar();
        initEditText();
        initFaceNameLoader();
        initMergeNameAdapter();
        initListView(inflate);
        return inflate;
    }

    public void onStart() {
        super.onStart();
        updateNameList();
    }

    public void onStop() {
        super.onStop();
        if (this.mMergeAdapter != null) {
            this.mMergeAdapter.changeCursor(null);
        }
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 6
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    public void showSetRelationDialog(final String str, final String str2) {
        PeopleRelationSetDialogFragment.createRelationSetDialog(this.mActivity, this.mActivity.getString(R.string.relation_with_you), null, 1, new RelationSelectedListener() {
            public void onRelationSelected(String str, String str2) {
                InputFaceNameFragment.this.onOkClick(str, false, str2, str, str2);
            }
        });
    }

    public void updateNameList() {
        String obj = this.mInputTextChanged ? this.mInputView.getText().toString() : null;
        if (!TextUtils.isEmpty(obj) || !this.mOnlyUseContactAdapter) {
            changeMergeResultCursor(obj);
        } else {
            this.mOnlyHasContactResult = true;
            this.mGetContactInfoHelper.getContactCursor();
        }
        this.mMergeAdapter.notifyDataSetChanged();
    }
}
