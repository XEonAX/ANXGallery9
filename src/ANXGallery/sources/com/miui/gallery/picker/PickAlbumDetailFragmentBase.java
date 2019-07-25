package com.miui.gallery.picker;

import android.content.Context;
import android.content.res.Configuration;
import android.database.Cursor;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.Checkable;
import android.widget.ListAdapter;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.picker.helper.AdapterHolder;
import com.miui.gallery.picker.helper.CursorUtils;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.picker.helper.PickerItemCheckedListener;
import com.miui.gallery.ui.MicroThumbGridItem;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.ToastUtils;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;
import java.util.Iterator;

public abstract class PickAlbumDetailFragmentBase extends PickerFragment {
    protected StickyGridHeadersGridView mAlbumDetailGridView;
    private String mPageName;
    protected SelectionHolder mSelections;
    private boolean mShouldContainUnique = true;

    protected class AlbumItemCheckListener extends PickerItemCheckedListener {
        public AlbumItemCheckListener(Picker picker) {
            super(picker);
        }

        public void onItemChecked(Cursor cursor, View view) {
            String sha1 = CursorUtils.getSha1(cursor);
            if (PickAlbumDetailFragmentBase.this.mPicker.contains(sha1)) {
                PickAlbumDetailFragmentBase.this.removeInternal(PickAlbumDetailFragmentBase.this.mPicker, sha1);
            } else if (!PickAlbumDetailFragmentBase.this.mPicker.isFull()) {
                PickAlbumDetailFragmentBase.this.pickInternal(PickAlbumDetailFragmentBase.this.mPicker, sha1);
            } else {
                ToastUtils.makeText(view.getContext(), (CharSequence) view.getContext().getString(R.string.picker_full_format, new Object[]{Integer.valueOf(PickAlbumDetailFragmentBase.this.mPicker.capacity())}));
            }
            if (view instanceof Checkable) {
                ((Checkable) view).setChecked(PickAlbumDetailFragmentBase.this.mPicker.contains(sha1));
            }
        }
    }

    public interface ItemStateListener {
        void onStateChanged();
    }

    static class SelectionHolder implements Iterable<String> {
        private AdapterHolder mAdapter;
        private ItemStateListener mItemStateListener;
        private ArrayList<String> mSelection = new ArrayList<>();

        public SelectionHolder(AdapterHolder adapterHolder) {
            this.mAdapter = adapterHolder;
        }

        private void updateState() {
            if (this.mItemStateListener != null) {
                this.mItemStateListener.onStateChanged();
            }
        }

        public boolean add(String str) {
            boolean add = this.mSelection.add(str);
            updateState();
            return add;
        }

        public void copyFrom(Picker picker) {
            this.mSelection.clear();
            BaseAdapter baseAdapter = this.mAdapter.get();
            for (int i = 0; i < baseAdapter.getCount(); i++) {
                String sha1 = CursorUtils.getSha1((Cursor) baseAdapter.getItem(i));
                if (picker.contains(sha1)) {
                    this.mSelection.add(sha1);
                }
            }
            updateState();
        }

        /* access modifiers changed from: 0000 */
        public boolean isAllSelected() {
            BaseAdapter baseAdapter = this.mAdapter.get();
            int size = this.mSelection.size();
            return size > 0 && baseAdapter != null && size == baseAdapter.getCount();
        }

        /* access modifiers changed from: 0000 */
        public boolean isNoneSelected() {
            return this.mSelection.size() == 0;
        }

        public Iterator iterator() {
            return this.mSelection.iterator();
        }

        public boolean remove(Object obj) {
            boolean remove = this.mSelection.remove(obj);
            updateState();
            return remove;
        }

        public void setItemStateListener(ItemStateListener itemStateListener) {
            this.mItemStateListener = itemStateListener;
        }
    }

    public PickAlbumDetailFragmentBase(String str) {
        this.mPageName = str;
    }

    /* access modifiers changed from: private */
    public void pickInternal(Picker picker, String str) {
        if (picker.pick(str) || !this.mShouldContainUnique) {
            this.mSelections.add(str);
        }
        GallerySamplingStatHelper.recordStringPropertyEvent("picker", "pick_event_page", this.mPageName);
    }

    private void refreshPickState() {
        int firstVisiblePosition = this.mAlbumDetailGridView.getFirstVisiblePosition();
        for (int i = 0; i < this.mAlbumDetailGridView.getChildCount(); i++) {
            View childAt = this.mAlbumDetailGridView.getChildAt(i);
            if (childAt instanceof com.miui.gallery.ui.Checkable) {
                ((com.miui.gallery.ui.Checkable) childAt).setChecked(this.mPicker.contains(CursorUtils.getSha1((Cursor) this.mAlbumDetailGridView.getItemAtPosition(firstVisiblePosition + i))));
            }
        }
    }

    /* access modifiers changed from: private */
    public void removeInternal(Picker picker, String str) {
        if (picker.remove(str) || !this.mShouldContainUnique) {
            this.mSelections.remove(str);
        }
    }

    /* access modifiers changed from: protected */
    public void bindCheckState(View view, Cursor cursor) {
        if (this.mPicker.getMode() == Mode.SINGLE) {
            if (view instanceof MicroThumbGridItem) {
                ((MicroThumbGridItem) view).setSimilarMarkEnable(true);
            }
            return;
        }
        com.miui.gallery.ui.Checkable checkable = (com.miui.gallery.ui.Checkable) view;
        checkable.setCheckable(true);
        checkable.setChecked(this.mPicker.contains(CursorUtils.getSha1(cursor)));
    }

    public void clear() {
        ListAdapter realAdapter = this.mAlbumDetailGridView.getRealAdapter();
        if (realAdapter != null) {
            for (int i = 0; i < realAdapter.getCount(); i++) {
                removeInternal(this.mPicker, CursorUtils.getSha1((Cursor) realAdapter.getItem(i)));
                if (this.mPicker.count() <= 0) {
                    break;
                }
            }
            refreshPickState();
        }
    }

    /* access modifiers changed from: protected */
    public void copy2Pick() {
        this.mSelections.copyFrom(getPicker());
    }

    /* access modifiers changed from: protected */
    public void intialSelections() {
        this.mSelections = new SelectionHolder(new AdapterHolder() {
            public BaseAdapter get() {
                return (BaseAdapter) PickAlbumDetailFragmentBase.this.mAlbumDetailGridView.getRealAdapter();
            }
        });
    }

    /* access modifiers changed from: protected */
    public boolean isAllSelected() {
        return this.mSelections != null && this.mSelections.isAllSelected();
    }

    /* access modifiers changed from: protected */
    public boolean isNoneSelected() {
        return this.mSelections == null || this.mSelections.isNoneSelected();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        int firstVisiblePosition = this.mAlbumDetailGridView.getFirstVisiblePosition();
        if (configuration.orientation == 2) {
            this.mAlbumDetailGridView.setNumColumns(ThumbConfig.get().sMicroThumbColumnsLand);
        } else {
            this.mAlbumDetailGridView.setNumColumns(ThumbConfig.get().sMicroThumbColumnsPortrait);
        }
        this.mAlbumDetailGridView.setSelection(firstVisiblePosition);
    }

    /* access modifiers changed from: protected */
    public boolean onPhotoItemClick(Cursor cursor) {
        if (this.mPicker.getMode() != Mode.SINGLE) {
            return false;
        }
        this.mPicker.pick(CursorUtils.getSha1(cursor));
        ((PickAlbumDetailActivityBase) this.mActivity).setResultCode(-1);
        this.mPicker.done();
        return true;
    }

    public void selectAll() {
        ListAdapter realAdapter = this.mAlbumDetailGridView.getRealAdapter();
        if (realAdapter != null) {
            int i = 0;
            while (true) {
                if (i >= realAdapter.getCount()) {
                    break;
                } else if (this.mPicker.isFull()) {
                    ToastUtils.makeText((Context) getActivity(), (CharSequence) getActivity().getString(R.string.picker_full_format, new Object[]{Integer.valueOf(this.mPicker.capacity())}));
                    break;
                } else {
                    pickInternal(this.mPicker, CursorUtils.getSha1((Cursor) realAdapter.getItem(i)));
                    i++;
                }
            }
            refreshPickState();
        }
    }

    public void setItemStateListener(ItemStateListener itemStateListener) {
        this.mSelections.setItemStateListener(itemStateListener);
    }

    public void setSelectionCloudNotContainUnique() {
        this.mShouldContainUnique = false;
    }
}
