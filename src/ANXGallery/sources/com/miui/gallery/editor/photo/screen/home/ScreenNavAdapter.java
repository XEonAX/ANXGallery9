package com.miui.gallery.editor.photo.screen.home;

import android.content.Context;
import android.content.res.Resources;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.screen.entity.ScreenNavigatorData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.Adapter;
import com.miui.gallery.util.ScreenUtils;
import java.util.List;

public class ScreenNavAdapter extends Adapter<ScreenNavigatorHolder> implements Selectable {
    private Delegator mDelegator;
    private int mItemWidth;
    private List<ScreenNavigatorData> mScreenNavigatorData;
    private int mStartMargin;

    static final class ScreenNavigatorHolder extends ViewHolder {
        private ImageView mIcon;
        private ImageView mSelected;
        private TextView mTextView;

        public ScreenNavigatorHolder(View view) {
            super(view);
            this.mTextView = (TextView) view.findViewById(R.id.label);
            this.mIcon = (ImageView) view.findViewById(R.id.icon);
            this.mSelected = (ImageView) view.findViewById(R.id.selected_iv);
        }

        /* access modifiers changed from: 0000 */
        public void bind(boolean z, ScreenNavigatorData screenNavigatorData) {
            this.mSelected.setVisibility((!z || screenNavigatorData.id == 5) ? 4 : 0);
            this.mIcon.setImageResource(screenNavigatorData.icon);
            this.mTextView.setText(screenNavigatorData.name);
        }
    }

    public ScreenNavAdapter(Context context, List<ScreenNavigatorData> list) {
        Resources resources;
        int i;
        this.mScreenNavigatorData = list;
        if (getItemCount() == 5) {
            resources = context.getResources();
            i = R.dimen.screen_editor_nav_marin_start_for_five;
        } else {
            resources = context.getResources();
            i = R.dimen.screen_editor_nav_marin_start;
        }
        this.mStartMargin = (int) resources.getDimension(i);
        this.mItemWidth = (ScreenUtils.getScreenWidth() - (this.mStartMargin * 2)) / getItemCount();
        this.mDelegator = new Delegator(-1, new Selector(context.getResources().getColor(R.color.photo_editor_highlight_color)));
    }

    public int getItemCount() {
        return this.mScreenNavigatorData.size();
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public int getStartMargin() {
        return this.mStartMargin;
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(ScreenNavigatorHolder screenNavigatorHolder, int i) {
        super.onBindViewHolder(screenNavigatorHolder, i);
        screenNavigatorHolder.bind(this.mDelegator.getSelection() == i, (ScreenNavigatorData) this.mScreenNavigatorData.get(i));
        this.mDelegator.onBindViewHolder(screenNavigatorHolder, i);
    }

    public ScreenNavigatorHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = getInflater().inflate(R.layout.screen_navigator_item, viewGroup, false);
        inflate.getLayoutParams().width = this.mItemWidth;
        return new ScreenNavigatorHolder(inflate);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        int selection = this.mDelegator.getSelection();
        if (selection != i) {
            this.mDelegator.setSelection(i);
            notifyItemChanged(selection);
            notifyItemChanged(i);
        }
    }
}
