package com.miui.gallery.widget.menu;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import java.util.ArrayList;

public class ImmersionMenuAdapter extends BaseAdapter {
    private LayoutInflater mInflater;
    /* access modifiers changed from: private */
    public OnItemCheckChangeListener mOnItemCheckChangeListener;
    private ArrayList<ImmersionMenuItem> mVisibleItems = new ArrayList<>();

    class CheckableHolder extends TextHolder implements OnCheckedChangeListener {
        CheckBox checkBox;
        ImmersionMenuItem data;

        CheckableHolder() {
            super();
        }

        public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
            if (ImmersionMenuAdapter.this.mOnItemCheckChangeListener != null && (this.data.isChecked() ^ z)) {
                ImmersionMenuAdapter.this.mOnItemCheckChangeListener.onItemCheckChanged(this.data, z);
            }
        }
    }

    public interface OnItemCheckChangeListener {
        void onItemCheckChanged(ImmersionMenuItem immersionMenuItem, boolean z);
    }

    class TextHolder {
        ImageView iconView;
        TextView informationText;
        View redDotView;
        TextView summaryText;
        TextView textView;

        TextHolder() {
        }
    }

    ImmersionMenuAdapter(Context context, ImmersionMenu immersionMenu) {
        this.mInflater = LayoutInflater.from(context);
        buildVisibleItems(immersionMenu, this.mVisibleItems);
    }

    private void buildVisibleItems(ImmersionMenu immersionMenu, ArrayList<ImmersionMenuItem> arrayList) {
        arrayList.clear();
        if (immersionMenu != null) {
            int size = immersionMenu.size();
            for (int i = 0; i < size; i++) {
                ImmersionMenuItem item = immersionMenu.getItem(i);
                if (item.isVisible()) {
                    arrayList.add(item);
                }
            }
        }
    }

    public int getCount() {
        return this.mVisibleItems.size();
    }

    public ImmersionMenuItem getItem(int i) {
        return (ImmersionMenuItem) this.mVisibleItems.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public int getItemViewType(int i) {
        return ((ImmersionMenuItem) this.mVisibleItems.get(i)).isCheckable() ? 1 : 0;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        int itemViewType = getItemViewType(i);
        int i2 = 0;
        if (itemViewType == 0) {
            if (view == null) {
                view = this.mInflater.inflate(R.layout.immersion_popup_menu_item, viewGroup, false);
                TextHolder textHolder = new TextHolder();
                textHolder.iconView = (ImageView) view.findViewById(R.id.icon);
                textHolder.textView = (TextView) view.findViewById(R.id.text);
                textHolder.summaryText = (TextView) view.findViewById(R.id.summary);
                textHolder.informationText = (TextView) view.findViewById(R.id.information);
                textHolder.redDotView = view.findViewById(R.id.red_dot);
                view.setTag(textHolder);
            }
        } else if (itemViewType == 1) {
            if (view == null) {
                view = this.mInflater.inflate(R.layout.immersion_popup_menu_checkable_item, viewGroup, false);
                CheckableHolder checkableHolder = new CheckableHolder();
                CheckableHolder checkableHolder2 = checkableHolder;
                checkableHolder.textView = (TextView) view.findViewById(R.id.text);
                checkableHolder.summaryText = (TextView) view.findViewById(R.id.summary);
                checkableHolder2.checkBox = (CheckBox) view.findViewById(R.id.check_box);
                checkableHolder2.checkBox.setOnCheckedChangeListener(checkableHolder2);
                view.setTag(checkableHolder);
            }
            CheckableHolder checkableHolder3 = (CheckableHolder) view.getTag();
            ImmersionMenuItem item = getItem(i);
            checkableHolder3.data = item;
            checkableHolder3.checkBox.setChecked(item.isChecked());
        }
        Object tag = view.getTag();
        if (tag != null) {
            TextHolder textHolder2 = (TextHolder) tag;
            ImmersionMenuItem item2 = getItem(i);
            textHolder2.textView.setText(item2.getTitle());
            if (!TextUtils.isEmpty(item2.getSummary())) {
                textHolder2.summaryText.setVisibility(0);
                textHolder2.summaryText.setText(item2.getSummary());
            } else {
                textHolder2.summaryText.setVisibility(8);
            }
            if (textHolder2.iconView != null) {
                if (item2.getIcon() != null) {
                    textHolder2.iconView.setVisibility(0);
                    textHolder2.iconView.setImageDrawable(item2.getIcon());
                } else {
                    textHolder2.iconView.setVisibility(8);
                }
            }
            if (textHolder2.informationText != null) {
                if (!TextUtils.isEmpty(item2.getInformation())) {
                    textHolder2.informationText.setVisibility(0);
                    textHolder2.informationText.setText(item2.getInformation());
                } else {
                    textHolder2.informationText.setVisibility(8);
                }
            }
            if (textHolder2.redDotView != null) {
                View view2 = textHolder2.redDotView;
                if (!item2.isRedDotDisplayed()) {
                    i2 = 4;
                }
                view2.setVisibility(i2);
            }
        }
        return view;
    }

    public int getViewTypeCount() {
        return 2;
    }

    public void setOnItemCheckChangeListener(OnItemCheckChangeListener onItemCheckChangeListener) {
        this.mOnItemCheckChangeListener = onItemCheckChangeListener;
    }

    public void toggleCheckableItem(View view) {
        if (view != null) {
            Object tag = view.getTag();
            if (tag instanceof CheckableHolder) {
                ((CheckableHolder) tag).checkBox.performClick();
            }
        }
    }

    public void update(ImmersionMenu immersionMenu) {
        buildVisibleItems(immersionMenu, this.mVisibleItems);
        notifyDataSetChanged();
    }
}
