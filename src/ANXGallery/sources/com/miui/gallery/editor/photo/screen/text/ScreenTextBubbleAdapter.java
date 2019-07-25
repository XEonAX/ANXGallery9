package com.miui.gallery.editor.photo.screen.text;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.TextData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.Adapter;
import java.util.List;

public class ScreenTextBubbleAdapter extends Adapter<ScreenTextBubbleHolder> implements Selectable {
    private Context mContext;
    private Delegator mDelegator;
    private List<TextData> mTextDataList;

    public ScreenTextBubbleAdapter(Context context, List<TextData> list, int i) {
        this.mTextDataList = list;
        this.mContext = context;
        this.mDelegator = new Delegator(i, new Selector(context.getResources().getDrawable(R.drawable.shape_text_edit_menu_selector)));
    }

    public int getItemCount() {
        if (this.mTextDataList == null) {
            return 0;
        }
        return this.mTextDataList.size();
    }

    public TextData getItemData(int i) {
        if (this.mTextDataList == null || i < 0 || i >= this.mTextDataList.size()) {
            return null;
        }
        return (TextData) this.mTextDataList.get(i);
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(ScreenTextBubbleHolder screenTextBubbleHolder, int i) {
        super.onBindViewHolder(screenTextBubbleHolder, i);
        screenTextBubbleHolder.bind((TextData) this.mTextDataList.get(i), i);
        this.mDelegator.onBindViewHolder(screenTextBubbleHolder, i);
    }

    public ScreenTextBubbleHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new ScreenTextBubbleHolder(LayoutInflater.from(this.mContext).inflate(R.layout.screen_text_menu_item, viewGroup, false));
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
