package uk.co.senab.photoview;

import android.graphics.RectF;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.MotionEvent;
import android.widget.ImageView;

public class DefaultOnDoubleTapListener implements OnDoubleTapListener {
    private PhotoViewAttacher photoViewAttacher;

    public DefaultOnDoubleTapListener(PhotoViewAttacher photoViewAttacher2) {
        setPhotoViewAttacher(photoViewAttacher2);
    }

    public boolean onDoubleTap(MotionEvent motionEvent) {
        if (this.photoViewAttacher == null) {
            return false;
        }
        if (!this.photoViewAttacher.canZoom()) {
            return true;
        }
        try {
            this.photoViewAttacher.onDoubleTap(motionEvent.getX(), motionEvent.getY());
        } catch (ArrayIndexOutOfBoundsException unused) {
        }
        return true;
    }

    public boolean onDoubleTapEvent(MotionEvent motionEvent) {
        return false;
    }

    public boolean onSingleTapConfirmed(MotionEvent motionEvent) {
        if (this.photoViewAttacher == null) {
            return false;
        }
        ImageView imageView = this.photoViewAttacher.getImageView();
        if (this.photoViewAttacher.getOnPhotoTapListener() != null) {
            RectF displayRect = this.photoViewAttacher.getDisplayRect();
            if (displayRect != null) {
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                if (displayRect.contains(x, y)) {
                    this.photoViewAttacher.getOnPhotoTapListener().onPhotoTap(imageView, (x - displayRect.left) / displayRect.width(), (y - displayRect.top) / displayRect.height());
                    return true;
                }
            }
        }
        if (this.photoViewAttacher.getOnViewTapListener() != null) {
            this.photoViewAttacher.getOnViewTapListener().onViewTap(imageView, motionEvent.getX(), motionEvent.getY());
        }
        return false;
    }

    public void setPhotoViewAttacher(PhotoViewAttacher photoViewAttacher2) {
        this.photoViewAttacher = photoViewAttacher2;
    }
}
