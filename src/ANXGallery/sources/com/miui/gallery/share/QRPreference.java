package com.miui.gallery.share;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import com.google.zxing.WriterException;
import com.miui.gallery.R;
import com.zxing.encoding.EncodingHandler;
import java.lang.ref.WeakReference;

public class QRPreference extends Preference implements OnClickListener {
    private WeakReference<Bitmap> mQRCodeRef;
    private OnClickListener mRetryListener;
    private Status mStatus;
    private String mTextQR;

    public enum Status {
        REQUESTING,
        SUCCESS,
        FAILED
    }

    public QRPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public QRPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mStatus = Status.REQUESTING;
        setLayoutResource(R.layout.share_album_qr_code_view);
    }

    private int getQRCodeParentSize() {
        return getContext().getResources().getDimensionPixelSize(R.dimen.qr_code_size);
    }

    private void update(View view) {
        View findViewById = view.findViewById(R.id.qr_code_error);
        View findViewById2 = view.findViewById(R.id.qr_code_requesting);
        ImageView imageView = (ImageView) view.findViewById(R.id.qr_code_image);
        if (this.mStatus == Status.REQUESTING) {
            findViewById2.setVisibility(0);
            findViewById.setVisibility(8);
            imageView.setVisibility(8);
        } else if (this.mStatus == Status.FAILED) {
            findViewById.setVisibility(0);
            findViewById2.setVisibility(8);
            imageView.setVisibility(8);
        } else if (this.mStatus == Status.SUCCESS) {
            imageView.setVisibility(0);
            findViewById.setVisibility(8);
            findViewById2.setVisibility(8);
            if (TextUtils.isEmpty(this.mTextQR)) {
                imageView.setImageBitmap(null);
                return;
            }
            try {
                SystemClock.uptimeMillis();
                Bitmap bitmap = this.mQRCodeRef != null ? (Bitmap) this.mQRCodeRef.get() : null;
                if (bitmap == null) {
                    bitmap = EncodingHandler.createQRCode(this.mTextQR, getContext().getResources().getDimensionPixelSize(R.dimen.album_share_qr_size));
                    if (bitmap != null) {
                        this.mQRCodeRef = new WeakReference<>(bitmap);
                    }
                }
                imageView.setImageBitmap(bitmap);
            } catch (WriterException unused) {
                imageView.setImageBitmap(null);
            } catch (OutOfMemoryError unused2) {
                imageView.setImageBitmap(null);
            }
        }
    }

    public String getQRText() {
        return this.mTextQR;
    }

    /* access modifiers changed from: protected */
    public void onBindView(View view) {
        super.onBindView(view);
        int qRCodeParentSize = getQRCodeParentSize();
        View findViewById = view.findViewById(R.id.qr_code_content);
        LayoutParams layoutParams = findViewById.getLayoutParams();
        layoutParams.height = qRCodeParentSize;
        layoutParams.width = qRCodeParentSize;
        findViewById.requestLayout();
        view.findViewById(R.id.retry_btn).setOnClickListener(this);
        update(view);
    }

    public void onClick(View view) {
        if (this.mRetryListener != null) {
            this.mRetryListener.onClick(view);
        }
    }

    public void setQRText(String str) {
        if (!TextUtils.equals(this.mTextQR, str)) {
            this.mTextQR = str;
            this.mQRCodeRef = null;
        }
    }

    public void setRetryListener(OnClickListener onClickListener) {
        this.mRetryListener = onClickListener;
    }

    public void setStatus(Status status) {
        this.mStatus = status;
        notifyChanged();
    }
}
