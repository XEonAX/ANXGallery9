package com.miui.gallery.card.ui.cardlist;

import android.app.Activity;
import android.graphics.Bitmap.Config;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.util.ActionURIHandler;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.AntiDoubleClickListener;
import com.miui.gallery.widget.CardCoverView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CardAdapter extends Adapter<ViewHolder> {
    /* access modifiers changed from: private */
    public final Activity mContext;
    private List<Card> mDataList = null;
    protected final DisplayImageOptions mDisplayImageOptions;
    private View mEmptyView;
    private View mFooterView;
    private View mHeaderView;
    private boolean mHideFooterWhenEmpty = false;
    private boolean mHideHeaderWhenEmpty = false;

    class CardHolder extends ViewHolder {
        private final AntiDoubleClickListener mAntiDoubleClickListener = new AntiDoubleClickListener() {
            public void onAntiDoubleClick(View view) {
                if (view.getId() == R.id.card_cover) {
                    CardHolder.this.deliveryAction();
                }
            }
        };
        private Card mCard;
        private final CardCoverView mCardCoverView;
        private final TextView mDescription;
        private final TextView mTitle;

        CardHolder(View view) {
            super(view);
            this.mCardCoverView = (CardCoverView) view.findViewById(R.id.card_cover);
            this.mTitle = (TextView) view.findViewById(R.id.title);
            this.mDescription = (TextView) view.findViewById(R.id.description);
            this.mCardCoverView.setOnClickListener(this.mAntiDoubleClickListener);
        }

        /* access modifiers changed from: private */
        public void deliveryAction() {
            if (this.mCard != null) {
                String detailUrl = this.mCard.getDetailUrl();
                if (TextUtils.isEmpty(detailUrl)) {
                    Log.e("CardAdapter", "deliveryAction empty");
                    return;
                }
                Bundle bundle = new Bundle();
                bundle.putLong("card_id", this.mCard.getId());
                bundle.putString("card_url", this.mCard.getActionUrl());
                ActionURIHandler.handleUri(CardAdapter.this.mContext, Uri.parse(detailUrl), bundle);
            } else {
                Log.e("CardAdapter", "card object is null");
            }
            recordCardClick();
        }

        private void recordCardClick() {
            HashMap hashMap = new HashMap();
            hashMap.put("scenarioId", String.valueOf(this.mCard.getScenarioId()));
            GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_click", hashMap);
        }

        public void bindData(Card card) {
            if (card != null) {
                this.mCard = card;
                int imageResId = card.getImageResId(CardAdapter.this.mContext);
                Uri imageUri = card.getImageUri();
                if (imageResId != 0) {
                    this.mCardCoverView.update(imageResId, CardAdapter.this.mDisplayImageOptions);
                } else if (MiscUtil.isValid(this.mCard.getCoverMediaFeatureItems())) {
                    List coverMediaFeatureItems = this.mCard.getCoverMediaFeatureItems();
                    List selectedMediaSha1s = card.getSelectedMediaSha1s();
                    this.mCardCoverView.setImageCount(selectedMediaSha1s != null ? selectedMediaSha1s.size() : 0);
                    if (coverMediaFeatureItems != null) {
                        this.mCardCoverView.update(coverMediaFeatureItems, CardAdapter.this.mDisplayImageOptions);
                    }
                } else {
                    CardManager.getInstance().updateCard(this.mCard);
                    if (imageUri != null) {
                        this.mCardCoverView.update(imageUri.toString(), CardAdapter.this.mDisplayImageOptions);
                    }
                }
                this.mTitle.setText(card.getTitle());
                if (TextUtils.isEmpty(card.getDescription())) {
                    this.mDescription.setVisibility(8);
                    return;
                }
                this.mDescription.setVisibility(0);
                this.mDescription.setText(card.getDescription());
            }
        }
    }

    class ViewHolderImpl extends ViewHolder {
        ViewHolderImpl(View view) {
            super(view);
        }
    }

    CardAdapter(Activity activity) {
        this.mContext = activity;
        this.mDisplayImageOptions = new Builder().considerExifParams(true).bitmapConfig(Config.RGB_565).imageScaleType(ImageScaleType.EXACTLY).resetViewBeforeLoading(true).showImageOnLoading((int) R.drawable.image_default_cover).cacheInMemory(true).build();
    }

    private Card getDataItem(int i) {
        if (this.mDataList == null) {
            return null;
        }
        return (Card) this.mDataList.get(i - (isHeaderVisible() ? 1 : 0));
    }

    private int getHeaderLayoutCount() {
        return isHeaderVisible() ? 1 : 0;
    }

    private boolean isFooterVisible() {
        return this.mFooterView != null && (getDataItemSize() != 0 || !this.mHideFooterWhenEmpty);
    }

    private boolean isHeaderVisible() {
        return this.mHeaderView != null && (getDataItemSize() != 0 || !this.mHideHeaderWhenEmpty);
    }

    public int getDataItemSize() {
        if (this.mDataList == null) {
            return 0;
        }
        return this.mDataList.size();
    }

    public int getItemCount() {
        int dataItemSize = getDataItemSize();
        return dataItemSize == 0 ? (isHeaderVisible() ? 1 : 0) + true : dataItemSize + (isHeaderVisible() ? 1 : 0) + (isFooterVisible() ? 1 : 0);
    }

    public int getItemViewType(int i) {
        if (isHeaderVisible() && i == 0) {
            return 1;
        }
        if (getDataItemSize() == 0 && this.mEmptyView != null && i == isHeaderVisible()) {
            return 3;
        }
        return (!isFooterVisible() || i != getItemCount() - 1) ? 0 : 2;
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        if (getItemViewType(i) == 0) {
            ((CardHolder) viewHolder).bindData(getDataItem(i));
        }
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return i == 1 ? new ViewHolderImpl(this.mHeaderView) : i == 2 ? new ViewHolderImpl(this.mFooterView) : i == 3 ? new ViewHolderImpl(this.mEmptyView) : new CardHolder(LayoutInflater.from(this.mContext).inflate(R.layout.card_item_layout, viewGroup, false));
    }

    /* access modifiers changed from: 0000 */
    public final void refreshNotifyItemChanged(int i) {
        notifyItemChanged(i + getHeaderLayoutCount());
    }

    public void setEmptyView(View view) {
        this.mEmptyView = view;
    }

    public void setFooter(View view, boolean z) {
        this.mFooterView = view;
        this.mHideFooterWhenEmpty = z;
    }

    /* access modifiers changed from: 0000 */
    public void updateDataList(List<Card> list) {
        if (this.mDataList == null) {
            this.mDataList = new ArrayList();
        }
        this.mDataList.clear();
        if (list != null) {
            this.mDataList.addAll(list);
        }
        notifyDataSetChanged();
    }
}
