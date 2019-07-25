package com.miui.gallery.people.mark;

import android.app.Dialog;
import android.content.ContentUris;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.SpannableString;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.CharacterStyle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.Window;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.people.PeopleDisplayHelper;
import com.miui.gallery.people.model.People;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.GalleryDialogFragment;
import com.miui.gallery.widget.recyclerview.GridLayoutInnerPaddingItemDecoration;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import java.util.ArrayList;

public class MarkPeopleDialogFragment extends GalleryDialogFragment implements OnClickListener {
    private Adapter mAdapter = new Adapter<PeopleItemViewHolder>() {
        public int getItemCount() {
            return MarkPeopleDialogFragment.this.mPeopleList.size();
        }

        public void onBindViewHolder(PeopleItemViewHolder peopleItemViewHolder, int i) {
            peopleItemViewHolder.bindView((People) MarkPeopleDialogFragment.this.mPeopleList.get(i));
        }

        public PeopleItemViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new PeopleItemViewHolder(LayoutInflater.from(MarkPeopleDialogFragment.this.getActivity()).inflate(R.layout.mark_people_item, null, false));
        }
    };
    private OnCancelListener mCancelButtonListener;
    private View mCancelView;
    private RecyclerView mDataView;
    private Dialog mDialog;
    private DisplayImageOptions mDisplayImageOptions = PeopleDisplayHelper.getDefaultPeopleDisplayOptionsBuilder().build();
    private GridLayoutManager mGridLayoutManager;
    private ItemDecoration mItemDecoration;
    private DialogInterface.OnClickListener mLoadMoreButtonListener;
    private String mLoadMoreButtonText;
    private TextView mLoadMoreView;
    /* access modifiers changed from: private */
    public ArrayList<People> mPeopleList;
    private OnPeopleSelectListener mPeopleSelectListener;
    private boolean mShowCancelButton = false;
    private View mSingleView;
    private ViewStub mSingleViewStub;
    private String mTitle;
    private TextView mTitleView;

    public interface OnPeopleSelectListener {
        void onPeopleSelected(int i, People people);
    }

    private class PeopleItemViewHolder extends ViewHolder {
        private ImageView mCover;

        public PeopleItemViewHolder(View view) {
            super(view);
            this.mCover = (ImageView) view.findViewById(R.id.icon);
        }

        public void bindView(People people) {
            MarkPeopleDialogFragment.this.bindPeopleCover(this.mCover, people);
            this.itemView.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    MarkPeopleDialogFragment.this.onClickPeople(PeopleItemViewHolder.this.getAdapterPosition());
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void bindPeopleCover(ImageView imageView, People people) {
        PeopleDisplayHelper.bindImage(imageView, people.getCoverPath(), ContentUris.withAppendedId(Cloud.CLOUD_URI, people.getCoverImageId()), this.mDisplayImageOptions, people.getCoverFaceRect(), people.getCoverType());
    }

    private void configCancelButton() {
        if (this.mCancelView == null) {
            return;
        }
        if (this.mShowCancelButton) {
            this.mCancelView.setVisibility(0);
            this.mCancelView.setOnClickListener(this);
            return;
        }
        this.mCancelView.setVisibility(8);
        this.mCancelView.setOnClickListener(null);
    }

    private void configDataView() {
        if (this.mPeopleList == null) {
            if (this.mDataView != null) {
                this.mDataView.setVisibility(8);
            }
            if (this.mSingleView != null) {
                this.mSingleView.setVisibility(8);
            }
        } else if (this.mPeopleList.size() == 1) {
            if (this.mSingleView == null && this.mSingleViewStub != null) {
                this.mSingleView = this.mSingleViewStub.inflate();
            }
            if (this.mSingleView != null) {
                bindPeopleCover((ImageView) this.mSingleView.findViewById(R.id.icon), (People) this.mPeopleList.get(0));
                this.mSingleView.setOnClickListener(new OnClickListener() {
                    public void onClick(View view) {
                        MarkPeopleDialogFragment.this.onClickPeople(0);
                    }
                });
                this.mSingleView.setVisibility(0);
            }
            if (this.mDataView != null) {
                this.mDataView.setVisibility(8);
            }
        } else {
            if (this.mDataView != null) {
                this.mDataView.setAdapter(this.mAdapter);
                this.mDataView.setVisibility(0);
            }
            if (this.mSingleView != null) {
                this.mSingleView.setVisibility(8);
            }
        }
    }

    private void configLoadMoreButton() {
        if (this.mLoadMoreView == null) {
            return;
        }
        if (!TextUtils.isEmpty(this.mLoadMoreButtonText)) {
            SpannableString spannableString = new SpannableString(this.mLoadMoreButtonText);
            spannableString.setSpan(new CharacterStyle() {
                public void updateDrawState(TextPaint textPaint) {
                    textPaint.setColor(MarkPeopleDialogFragment.this.getResources().getColor(R.color.text_blue));
                    textPaint.setUnderlineText(true);
                }
            }, 0, this.mLoadMoreButtonText.length(), 33);
            this.mLoadMoreView.setText(spannableString);
            this.mLoadMoreView.setVisibility(0);
            this.mLoadMoreView.setOnClickListener(this);
            return;
        }
        this.mLoadMoreView.setVisibility(8);
        this.mLoadMoreView.setOnClickListener(null);
    }

    /* access modifiers changed from: private */
    public void onClickPeople(int i) {
        if (i >= 0 && i < this.mPeopleList.size() && this.mPeopleSelectListener != null) {
            this.mPeopleSelectListener.onPeopleSelected(i, (People) this.mPeopleList.get(i));
        }
    }

    public void configTitle() {
        if (this.mTitleView != null) {
            this.mTitleView.setText(this.mTitle);
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        if (this.mCancelButtonListener != null) {
            this.mCancelButtonListener.onCancel(dialogInterface);
        }
    }

    public void onClick(View view) {
        if (view != null) {
            int id = view.getId();
            if (id != R.id.close_button) {
                if (id == R.id.load_more_button && this.mLoadMoreButtonListener != null) {
                    this.mLoadMoreButtonListener.onClick(this.mDialog, -10);
                }
            } else if (this.mCancelButtonListener != null) {
                this.mCancelButtonListener.onCancel(this.mDialog);
            }
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (isAdded() && this.mGridLayoutManager != null && this.mDataView != null) {
            this.mGridLayoutManager.setSpanCount(getResources().getInteger(R.integer.mark_people_column_count));
            MiscUtil.invokeSafely(this.mDataView, "markItemDecorInsetsDirty", null, new Object[0]);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        if (bundle != null) {
            this.mTitle = bundle.getString("MarkPeopleDialogFragment_Title");
            this.mLoadMoreButtonText = bundle.getString("MarkPeopleDialogFragment_LoadMoreButtonText");
            this.mShowCancelButton = bundle.getBoolean("MarkPeopleDialogFragment_ShowCancelButton", false);
            if (bundle.getSerializable("MarkPeopleDialogFragment_PeopleList") != null) {
                this.mPeopleList = (ArrayList) bundle.getSerializable("MarkPeopleDialogFragment_PeopleList");
            }
        }
        Dialog dialog = new Dialog(getActivity());
        View inflate = getActivity().getLayoutInflater().inflate(R.layout.mark_people_dialog_layout, null, false);
        dialog.setContentView(inflate);
        dialog.setCancelable(false);
        this.mTitleView = (TextView) inflate.findViewById(R.id.dialog_title);
        this.mCancelView = inflate.findViewById(R.id.close_button);
        this.mLoadMoreView = (TextView) inflate.findViewById(R.id.load_more_button);
        this.mDataView = (RecyclerView) inflate.findViewById(R.id.data_view);
        this.mGridLayoutManager = new GridLayoutManager(getActivity(), getResources().getInteger(R.integer.mark_people_column_count));
        this.mDataView.setLayoutManager(this.mGridLayoutManager);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.people_dialog_people_view_horizontal_padding);
        GridLayoutInnerPaddingItemDecoration gridLayoutInnerPaddingItemDecoration = new GridLayoutInnerPaddingItemDecoration(dimensionPixelSize, 0, dimensionPixelSize, 0, 0, getResources().getDimensionPixelSize(R.dimen.people_dialog_people_item_vertical_padding), false, this.mGridLayoutManager);
        this.mItemDecoration = gridLayoutInnerPaddingItemDecoration;
        this.mDataView.addItemDecoration(this.mItemDecoration);
        this.mSingleViewStub = (ViewStub) inflate.findViewById(R.id.single_people_view);
        configTitle();
        configCancelButton();
        configLoadMoreButton();
        configDataView();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setGravity(80);
            window.setLayout(-1, -2);
        }
        this.mDialog = dialog;
        return this.mDialog;
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (!TextUtils.isEmpty(this.mTitle)) {
            bundle.putString("MarkPeopleDialogFragment_Title", this.mTitle);
        }
        if (!TextUtils.isEmpty(this.mLoadMoreButtonText)) {
            bundle.putString("MarkPeopleDialogFragment_LoadMoreButtonText", this.mLoadMoreButtonText);
        }
        bundle.putBoolean("MarkPeopleDialogFragment_ShowCancelButton", this.mShowCancelButton);
        if (this.mPeopleList != null) {
            bundle.putParcelableArrayList("MarkPeopleDialogFragment_PeopleList", this.mPeopleList);
        }
    }

    public void setCancelButton(boolean z, OnCancelListener onCancelListener) {
        this.mShowCancelButton = z;
        this.mCancelButtonListener = onCancelListener;
        configCancelButton();
    }

    public void setLoadMoreButton(String str, DialogInterface.OnClickListener onClickListener) {
        this.mLoadMoreButtonText = str;
        this.mLoadMoreButtonListener = onClickListener;
        configLoadMoreButton();
    }

    public void setPeopleList(ArrayList<People> arrayList, OnPeopleSelectListener onPeopleSelectListener) {
        this.mPeopleList = arrayList;
        this.mPeopleSelectListener = onPeopleSelectListener;
        configDataView();
        if (isAdded()) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    public void setTitle(String str) {
        this.mTitle = str;
        configTitle();
    }
}
