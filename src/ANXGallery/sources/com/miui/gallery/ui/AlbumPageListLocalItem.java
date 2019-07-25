package com.miui.gallery.ui;

import android.content.Context;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.OtherAlbum;
import java.util.ArrayList;

public class AlbumPageListLocalItem extends AlbumPageListItemBase {
    protected TextView mAlbumNameDesc;
    protected TextView mMoreAlbumHint;

    public AlbumPageListLocalItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public static String getFormedNameNotExceedMaxWidth(Context context, ArrayList<String> arrayList, TextView textView) {
        TextPaint paint = textView.getPaint();
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.album_name_max_len);
        String str = (String) arrayList.get(0);
        float measureText = paint.measureText(str);
        float f = (float) dimensionPixelSize;
        if (measureText > f) {
            return str;
        }
        String string = context.getString(R.string.name_split);
        float measureText2 = paint.measureText(string);
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        for (int i = 1; i < arrayList.size(); i++) {
            float f2 = measureText + measureText2;
            if (f2 > f) {
                break;
            }
            String str2 = (String) arrayList.get(i);
            measureText = f2 + paint.measureText(str2);
            if (measureText > f) {
                break;
            }
            sb.append(string);
            sb.append(str2);
        }
        return sb.toString();
    }

    public void bindAlbumNameDesc(Context context, Album album) {
        if (album instanceof OtherAlbum) {
            this.mAlbumNameDesc.setText(getFormedNameNotExceedMaxWidth(context, ((OtherAlbum) album).getAlbumNames(), this.mAlbumNameDesc));
        } else {
            this.mAlbumNameDesc.setText(album.getLocalizedAlbumName());
        }
        if (album.getCount() > 1) {
            this.mMoreAlbumHint.setVisibility(0);
        } else {
            this.mMoreAlbumHint.setVisibility(8);
        }
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mMoreAlbumHint = (TextView) findViewById(R.id.more_album_hint);
        this.mAlbumNameDesc = (TextView) findViewById(R.id.album_name_desc);
    }
}
