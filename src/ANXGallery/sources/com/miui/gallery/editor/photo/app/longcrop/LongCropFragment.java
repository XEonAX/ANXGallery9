package com.miui.gallery.editor.photo.app.longcrop;

import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.MenuFragment;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractLongCropFragment;

public class LongCropFragment extends MenuFragment<AbstractLongCropFragment, SdkProvider<Object, AbstractLongCropFragment>> {
    private AsyncTask<Void, Void, Bitmap> mDecodeTask = new AsyncTask<Void, Void, Bitmap>() {
        /* access modifiers changed from: protected */
        public Bitmap doInBackground(Void... voidArr) {
            return LongCropFragment.this.decodeOrigin();
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            if (bitmap != null) {
                ((AbstractLongCropFragment) LongCropFragment.this.getRenderFragment()).setOriginBitmap(bitmap, LongCropFragment.this.getPreRenderData());
            }
        }
    };
    private TextView mTitle;

    public LongCropFragment() {
        super(Effect.LONG_CROP);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mDecodeTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.common_menu_bottom_bar, viewGroup, false);
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mTitle = (TextView) view.findViewById(R.id.title);
        this.mTitle.setText(R.string.photo_editor_long_crop);
    }
}
