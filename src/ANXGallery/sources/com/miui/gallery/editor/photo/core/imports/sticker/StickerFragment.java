package com.miui.gallery.editor.photo.core.imports.sticker;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Metadata;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class StickerFragment extends AbstractEffectFragment {
    private List<StickerItem> mData = new ArrayList();
    /* access modifiers changed from: private */
    public StickerEditorView mStickerEditorView;

    private class DecodeTask extends AsyncTask<Void, Void, Bitmap> {
        private StickerItem mItem;

        public DecodeTask(StickerItem stickerItem) {
            this.mItem = stickerItem;
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(Void... voidArr) {
            return BitmapFactory.decodeFile(this.mItem.content);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            super.onPostExecute(bitmap);
            StickerProvider.INSTANCE.putToCache(this.mItem, bitmap);
            StickerFragment.this.mStickerEditorView.add(bitmap, this.mItem.content, this.mItem.id, this.mItem.cateName);
        }
    }

    public void add(Metadata metadata, Object obj) {
        StickerItem stickerItem = (StickerItem) metadata;
        Bitmap fromCache = StickerProvider.INSTANCE.fromCache(stickerItem);
        if (fromCache != null) {
            this.mStickerEditorView.add(fromCache, stickerItem.content, stickerItem.id, stickerItem.cateName);
        } else {
            new DecodeTask(stickerItem).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        }
        this.mData.add(stickerItem);
        StickerProvider.INSTANCE.touch(stickerItem);
    }

    public void clear() {
        this.mData.clear();
        this.mStickerEditorView.onClear();
    }

    public boolean isEmpty() {
        return this.mData.isEmpty();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ViewGroup viewGroup2 = (ViewGroup) layoutInflater.inflate(R.layout.editor_view_container, viewGroup, false);
        this.mStickerEditorView = new StickerEditorView(getActivity());
        this.mStickerEditorView.setBitmap(getBitmap());
        viewGroup2.addView(this.mStickerEditorView, -1, -1);
        return viewGroup2;
    }

    public void onDestroy() {
        super.onDestroy();
        this.mStickerEditorView.onDestroy();
    }

    public void onDestroyView() {
        super.onDestroyView();
        StickerProvider.INSTANCE.writeRecentToFile();
    }

    public RenderData onExport() {
        return new StickerRenderData(this.mStickerEditorView.export());
    }

    /* access modifiers changed from: protected */
    public List<String> onSample() {
        ArrayList arrayList = new ArrayList();
        List<StickerNode> cacheNode = this.mStickerEditorView.getCacheNode();
        if (MiscUtil.isValid(cacheNode)) {
            for (StickerNode stickerNode : cacheNode) {
                String str = stickerNode.mStickerCateName;
                String l = Long.toString(stickerNode.mStickerId);
                Locale locale = Locale.US;
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append("(%s)");
                arrayList.add(String.format(locale, sb.toString(), new Object[]{l.substring(l.length() - 2)}));
            }
        }
        return arrayList;
    }

    public void remove(Metadata metadata) {
    }

    public void render() {
    }

    public void setBitmap(Bitmap bitmap) {
        super.setBitmap(bitmap);
        if (this.mStickerEditorView != null) {
            this.mStickerEditorView.setBitmap(bitmap);
        }
    }
}
