package com.miui.gallery.editor.photo.core.imports.text.editdialog;

import android.content.Context;
import android.graphics.Typeface;
import android.support.v7.widget.LinearLayoutManager;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.text.TextFontConfig;
import com.miui.gallery.editor.photo.core.imports.text.editdialog.TextEditDialog.ConfigChangeListener;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.typeface.DownloadCallback;
import com.miui.gallery.editor.photo.core.imports.text.typeface.FontDownloadManager;
import com.miui.gallery.editor.photo.core.imports.text.typeface.FontResourceRequest;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TypeFaceAdapter;
import com.miui.gallery.editor.photo.core.imports.text.utils.TextTools;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.SingleChoiceRecyclerView;
import com.miui.gallery.ui.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import com.miui.gallery.ui.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.ItemSelectChangeListener;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class DialogFontMenu extends DialogSubMenu<ConfigChangeListener, DialogStatusData> {
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public TextStyle mCurrentTextStyle;
    private FontDownloadManager mFontDownloadManager;
    private FontResourceRequest mFontRequest;
    /* access modifiers changed from: private */
    public DialogStatusData mInitializeData;
    private SingleChoiceRecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public List<TextStyle> mTextStyles;
    /* access modifiers changed from: private */
    public TypeFaceAdapter mTypeFaceAdapter;
    /* access modifiers changed from: private */
    public boolean mTypeFaceInited = false;
    private ViewGroup mWholeView;

    class TypeFaceItemSelectChangeListener implements ItemSelectChangeListener {
        TypeFaceItemSelectChangeListener() {
        }

        public boolean onItemSelect(SingleChoiceRecyclerViewAdapter singleChoiceRecyclerViewAdapter, int i, boolean z) {
            DialogFontMenu.this.mCurrentTextStyle = (TextStyle) DialogFontMenu.this.mTextStyles.get(i);
            if (DialogFontMenu.this.mCurrentTextStyle.isLocal()) {
                DialogFontMenu.this.updateSelectedItemPosition(i);
                if (DialogFontMenu.this.mListener != null) {
                    ((ConfigChangeListener) DialogFontMenu.this.mListener).onTypefaceChange(DialogFontMenu.this.mCurrentTextStyle);
                }
            } else if (DialogFontMenu.this.mCurrentTextStyle.isExtra()) {
                if (DialogFontMenu.this.mCurrentTextStyle.isNeedDownload()) {
                    DialogFontMenu.this.downloadResource(DialogFontMenu.this.mContext, DialogFontMenu.this.mCurrentTextStyle, i);
                } else if (DialogFontMenu.this.mCurrentTextStyle.isDownloaded()) {
                    DialogFontMenu.this.updateSelectedItemPosition(i);
                    if (DialogFontMenu.this.mListener != null) {
                        ((ConfigChangeListener) DialogFontMenu.this.mListener).onTypefaceChange(DialogFontMenu.this.mCurrentTextStyle);
                    }
                }
            }
            return true;
        }
    }

    DialogFontMenu(Context context, ViewGroup viewGroup, ConfigChangeListener configChangeListener) {
        super(context, viewGroup, R.string.text_edit_dialog_font, R.drawable.text_edit_dialog_tab_icon_font);
        this.mContext = context;
        this.mListener = configChangeListener;
    }

    /* access modifiers changed from: private */
    public void downloadResource(Context context, final TextStyle textStyle, final int i) {
        if (this.mFontDownloadManager == null) {
            this.mFontDownloadManager = new FontDownloadManager();
        }
        this.mFontDownloadManager.downloadFontResource(context, textStyle, new DownloadCallback() {
            public void onCompleted(boolean z) {
                Log.d("DialogFontMenu", "%s download is : %s", textStyle.getText(), Boolean.valueOf(z));
                if (z) {
                    ThreadManager.getMiscPool().submit(new Job<Object>() {
                        public Object run(JobContext jobContext) {
                            String filePath = textStyle.getFilePath();
                            if (FileUtils.isFileExist(filePath)) {
                                textStyle.setTypeFace(Typeface.createFromFile(filePath));
                            }
                            return null;
                        }
                    }, new FutureHandler<Object>() {
                        public void onPostExecute(Future<Object> future) {
                            textStyle.setState(0);
                            DialogFontMenu.this.notifyItemChanged(i);
                        }
                    });
                    return;
                }
                textStyle.setState(20);
                DialogFontMenu.this.notifyItemChanged(i);
            }

            public void onStart() {
                textStyle.setState(18);
                DialogFontMenu.this.notifyItemChanged(i);
            }
        });
    }

    private boolean isEquals(Typeface typeface, Typeface typeface2) {
        return (typeface == null && typeface2 == null) || (typeface != null && typeface.equals(typeface2));
    }

    private void loadResourceData() {
        if (!TextTools.isZhCNLanguage()) {
            TextTools.checkResourceExist(this.mTextStyles);
            this.mTypeFaceAdapter.notifyDataSetChanged();
            return;
        }
        Log.d("DialogFontMenu", "loadResourceData start.");
        final long currentTimeMillis = System.currentTimeMillis();
        this.mFontRequest = new FontResourceRequest();
        this.mFontRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                Log.d("DialogFontMenu", "loadResourceData success, use time %s  ms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                List<TextStyle> list = objArr[0];
                if (MiscUtil.isValid(list)) {
                    Collections.sort(list);
                    boolean isNightMode = MiscUtil.isNightMode(DialogFontMenu.this.mContext);
                    for (TextStyle textStyle : list) {
                        if (!isNightMode && !textStyle.getExtraInfo().isDarkModeData()) {
                            DialogFontMenu.this.mTextStyles.add(textStyle);
                        }
                        if (isNightMode && textStyle.getExtraInfo().isDarkModeData()) {
                            DialogFontMenu.this.mTextStyles.add(textStyle);
                        }
                    }
                    TextTools.checkResourceExist(DialogFontMenu.this.mTextStyles);
                    ThreadManager.runOnMainThread(new Runnable() {
                        public void run() {
                            DialogFontMenu.this.mTypeFaceInited = true;
                            DialogFontMenu.this.initializeData(DialogFontMenu.this.mInitializeData);
                        }
                    });
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                Log.d("DialogFontMenu", "loadResourceData error: %s, errorCode: %s", str, errorCode.toString());
                TextTools.checkResourceExist(DialogFontMenu.this.mTextStyles);
                ThreadManager.runOnMainThread(new Runnable() {
                    public void run() {
                        if (DialogFontMenu.this.mTypeFaceAdapter != null) {
                            DialogFontMenu.this.mTypeFaceAdapter.notifyDataSetChanged();
                        }
                    }
                });
            }
        });
    }

    /* access modifiers changed from: private */
    public void updateSelectedItemPosition(int i) {
        if (i != this.mTypeFaceAdapter.getSelectedItemPosition()) {
            this.mTypeFaceAdapter.setSelectedItemPosition(i);
            this.mTypeFaceAdapter.clearLastSelectedPostion();
        }
    }

    /* access modifiers changed from: 0000 */
    public ViewGroup initSubMenuView(Context context, ViewGroup viewGroup) {
        TextFontConfig.init(context);
        this.mWholeView = (ViewGroup) LayoutInflater.from(context).inflate(R.layout.text_edit_dialog_options_font_panel, viewGroup, false);
        this.mRecyclerView = (SingleChoiceRecyclerView) this.mWholeView.findViewById(R.id.text_edit_dialog_tab_font_recycler);
        this.mTextStyles = new ArrayList();
        this.mTextStyles.add(TextStyle.getLocalTextStyle());
        this.mTypeFaceAdapter = new TypeFaceAdapter(context, this.mTextStyles);
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(context));
        this.mRecyclerView.setAdapter(this.mTypeFaceAdapter);
        this.mTypeFaceAdapter.setItemSelectChangeListener(new TypeFaceItemSelectChangeListener());
        loadResourceData();
        return this.mWholeView;
    }

    public void initializeData(DialogStatusData dialogStatusData) {
        this.mInitializeData = dialogStatusData;
        if (this.mTypeFaceInited && dialogStatusData != null) {
            Typeface typeFace = dialogStatusData.textStyle == null ? Typeface.DEFAULT : dialogStatusData.textStyle.getTypeFace();
            if (this.mTypeFaceAdapter != null) {
                for (int i = 0; i < this.mTextStyles.size(); i++) {
                    if (isEquals(typeFace, ((TextStyle) this.mTextStyles.get(i)).getTypeFace())) {
                        updateSelectedItemPosition(i);
                        this.mTypeFaceAdapter.notifyDataSetChanged();
                    }
                }
            }
        }
    }

    public void notifyItemChanged(int i) {
        if (this.mTypeFaceAdapter != null) {
            this.mTypeFaceAdapter.notifyItemChanged(i, Integer.valueOf(1));
        }
    }

    public void release() {
        if (this.mFontRequest != null) {
            this.mFontRequest.cancel();
        }
        if (this.mFontDownloadManager != null) {
            this.mFontDownloadManager.cancelAll();
        }
        if (MiscUtil.isValid(this.mTextStyles)) {
            for (TextStyle textStyle : this.mTextStyles) {
                if (textStyle != null) {
                    if (textStyle.isDownloading()) {
                        textStyle.setState(20);
                    }
                } else {
                    return;
                }
            }
        }
    }
}
