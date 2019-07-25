package com.miui.gallery.editor.photo.app.sticker;

import android.content.Context;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.TextView;
import com.miui.gallery.editor.photo.core.common.model.StickerCategory;

public class HeaderHolder extends ViewHolder {
    private TextView mTitle;

    public HeaderHolder(View view) {
        super(view);
        if (view instanceof TextView) {
            this.mTitle = (TextView) view;
        }
    }

    /* access modifiers changed from: 0000 */
    public void bind(StickerCategory stickerCategory) {
        if (this.mTitle != null) {
            Context context = this.mTitle.getContext();
            int identifier = context.getResources().getIdentifier(stickerCategory.name, "string", "com.miui.gallery");
            if (identifier != 0) {
                this.mTitle.setText(context.getString(identifier));
            }
        }
    }
}
