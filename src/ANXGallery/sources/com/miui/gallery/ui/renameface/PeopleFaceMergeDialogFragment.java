package com.miui.gallery.ui.renameface;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.model.DisplayFolderItem;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.ui.renameface.FolderItemsLoader.LoaderUpdatedItems;
import com.miui.gallery.widget.GalleryDialogFragment;
import com.miui.gallery.widget.PagerAdapter;
import com.miui.gallery.widget.PagerGridLayout;
import com.miui.gallery.widget.PagerGridLayout.BaseAdapter;
import com.miui.gallery.widget.PagerIndicator;
import com.miui.gallery.widget.ViewPager;
import com.miui.gallery.widget.ViewPager.OnPageChangeListener;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.ArrayList;

public class PeopleFaceMergeDialogFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public ArrayList<DisplayFolderItem> mItems;
    /* access modifiers changed from: private */
    public FolderItemsLoader mLoader;
    /* access modifiers changed from: private */
    public PeoplePagerAdapter mPagerAdapter;
    /* access modifiers changed from: private */
    public PagerIndicator mPagerIndicator;
    /* access modifiers changed from: private */
    public PeopleSelectListener mPeopleSelectListener;
    private ViewPager mViewPager;

    private class PageChangeListener implements OnPageChangeListener {
        private PageChangeListener() {
        }

        public void onPageScrollStateChanged(int i) {
        }

        public void onPageScrolled(int i, float f, int i2) {
        }

        public void onPageSelected(int i) {
            if (PeopleFaceMergeDialogFragment.this.mPagerAdapter.getCount() > 1) {
                PeopleFaceMergeDialogFragment.this.mPagerIndicator.showIndex(i, PeopleFaceMergeDialogFragment.this.mPagerAdapter.getCount());
            }
        }
    }

    private class PagerGridLayoutAdapter extends BaseAdapter {
        private ArrayList<DisplayFolderItem> mGridLayoutItems;

        public class ViewHolder {
            ImageView cover;
            TextView name;

            public ViewHolder(View view) {
                this.name = (TextView) view.findViewById(R.id.name);
                this.cover = (ImageView) view.findViewById(R.id.face);
            }

            public void bindView(FaceDisplayFolderItem faceDisplayFolderItem) {
                if (faceDisplayFolderItem.isTip) {
                    this.cover.setBackgroundResource(R.drawable.create_new_face);
                    this.cover.setTag(Integer.valueOf(0));
                    this.name.setText(PeopleFaceMergeDialogFragment.this.getString(R.string.create_new_face));
                } else {
                    this.name.setText(faceDisplayFolderItem.name);
                    this.cover.setTag(Integer.valueOf(1));
                    ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(faceDisplayFolderItem.thumbnailPath), this.cover, InputFaceNameFragment.sDisplayImageOptions, (ImageSize) null, faceDisplayFolderItem.mFacePosRelative);
                }
                PagerGridLayoutAdapter.this.setItemClickListener(this.cover, faceDisplayFolderItem);
            }
        }

        public PagerGridLayoutAdapter(ArrayList<DisplayFolderItem> arrayList) {
            this.mGridLayoutItems = arrayList;
        }

        /* access modifiers changed from: private */
        public void setItemClickListener(View view, final FaceDisplayFolderItem faceDisplayFolderItem) {
            view.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    String str = faceDisplayFolderItem.name;
                    PeopleFaceMergeDialogFragment.this.mPeopleSelectListener.onPeopleSelect(faceDisplayFolderItem, (str != null ? FaceAlbumRenameHandler.getDisplayFolderItem(PeopleFaceMergeDialogFragment.this.mLoader.tryToGetLoadedItems(300), str.trim()) : null) != null, ((Integer) view.getTag()).intValue());
                }
            });
        }

        public void bindData(int i, View view) {
            ((ViewHolder) view.getTag()).bindView((FaceDisplayFolderItem) this.mGridLayoutItems.get(i));
        }

        public void freshView(View view) {
        }

        public int getColumnsCount() {
            return 4;
        }

        public int getCount() {
            if (this.mGridLayoutItems == null) {
                return 0;
            }
            return this.mGridLayoutItems.size();
        }

        public int getRowsCount() {
            return 2;
        }

        public View getView(LayoutInflater layoutInflater, ViewGroup viewGroup) {
            View inflate = layoutInflater.inflate(R.layout.people_face_merge_pager_item, viewGroup, false);
            inflate.setTag(new ViewHolder(inflate));
            return inflate;
        }

        public void onPageChanged() {
        }

        public void updateItems(ArrayList<DisplayFolderItem> arrayList) {
            this.mGridLayoutItems = arrayList;
            notifyDataSetChanged();
        }
    }

    private class PeoplePagerAdapter extends PagerAdapter {
        private PagerGridLayoutAdapter mAdapter;

        private PeoplePagerAdapter() {
            this.mAdapter = new PagerGridLayoutAdapter(PeopleFaceMergeDialogFragment.this.mItems);
        }

        private PagerGridLayout getPagerLayout() {
            PagerGridLayout pagerGridLayout = new PagerGridLayout(PeopleFaceMergeDialogFragment.this.getActivity());
            int dimensionPixelSize = PeopleFaceMergeDialogFragment.this.getActivity().getResources().getDimensionPixelSize(R.dimen.people_face_merge_dialog_padding);
            pagerGridLayout.setPaddingRelative(dimensionPixelSize, 0, dimensionPixelSize, 0);
            return pagerGridLayout;
        }

        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            viewGroup.removeView((View) obj);
        }

        public int getCount() {
            if (PeopleFaceMergeDialogFragment.this.mItems == null) {
                return 0;
            }
            return (PeopleFaceMergeDialogFragment.this.mItems.size() + 7) / 8;
        }

        public int getItemPosition(Object obj, int i) {
            return (i <= 0 || i >= getCount()) ? -2 : -3;
        }

        public Object instantiateItem(ViewGroup viewGroup, int i) {
            PagerGridLayout pagerLayout = getPagerLayout();
            pagerLayout.setAdapter(this.mAdapter, i);
            viewGroup.addView(pagerLayout);
            return pagerLayout;
        }

        public boolean isViewFromObject(View view, Object obj) {
            return view == obj;
        }

        public void updateItems(ArrayList<DisplayFolderItem> arrayList) {
            PeopleFaceMergeDialogFragment.this.mItems.addAll(arrayList);
            this.mAdapter.updateItems(PeopleFaceMergeDialogFragment.this.mItems);
            notifyDataSetChanged();
        }
    }

    public interface PeopleSelectListener {
        void onPeopleSelect(FaceDisplayFolderItem faceDisplayFolderItem, boolean z, int i);
    }

    private void initPagerLoader(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet) {
        this.mLoader = new FaceFolderItemsLoader(getActivity(), null, new LoaderUpdatedItems() {
            public void onLoaderUpdatedItems() {
                Dialog dialog = PeopleFaceMergeDialogFragment.this.getDialog();
                if (dialog != null && dialog.isShowing()) {
                    PeopleFaceMergeDialogFragment.this.mPagerAdapter.updateItems(PeopleFaceMergeDialogFragment.this.mLoader.unblockGetItems());
                }
            }
        }, normalPeopleFaceMediaSet != null ? new long[]{normalPeopleFaceMediaSet.getBucketId()} : null);
    }

    private void setCancelButtonClickListener(Button button, final Dialog dialog) {
        button.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                dialog.cancel();
            }
        });
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        this.mLoader.cancel();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        NormalPeopleFaceMediaSet normalPeopleFaceMediaSet = (NormalPeopleFaceMediaSet) getArguments().getParcelable("merge_action_from_album");
        this.mItems = new ArrayList<>();
        this.mItems.add(new FaceDisplayFolderItem(true));
        this.mPagerAdapter = new PeoplePagerAdapter();
        initPagerLoader(normalPeopleFaceMediaSet);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        View inflate = getActivity().getLayoutInflater().inflate(R.layout.people_face_merge, null, false);
        this.mPagerIndicator = (PagerIndicator) inflate.findViewById(R.id.pager_index);
        this.mViewPager = (ViewPager) inflate.findViewById(R.id.pager);
        this.mViewPager.setAdapter(this.mPagerAdapter);
        this.mViewPager.setOnPageChangeListener(new PageChangeListener());
        Button button = (Button) inflate.findViewById(R.id.button1);
        ((TextView) inflate.findViewById(R.id.alertTitle)).setText(getArguments().getString("people_face_Merge_title"));
        Dialog dialog = new Dialog(getActivity());
        dialog.setContentView(inflate);
        setCancelButtonClickListener(button, dialog);
        Window window = dialog.getWindow();
        window.setGravity(80);
        window.setLayout(-1, -2);
        return dialog;
    }

    public void setPeopleSelectListener(PeopleSelectListener peopleSelectListener) {
        this.mPeopleSelectListener = peopleSelectListener;
    }
}
