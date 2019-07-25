package uk.co.senab.photoview.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.MotionEvent;
import uk.co.senab.photoview.Compat;

@TargetApi(5)
public class EclairGestureDetector extends CupcakeGestureDetector {
    private int mActivePointerId = -1;
    private int mActivePointerIndex = 0;

    public EclairGestureDetector(Context context) {
        super(context);
    }

    /* access modifiers changed from: 0000 */
    public float getActiveX(MotionEvent motionEvent) {
        try {
            return motionEvent.getX(this.mActivePointerIndex);
        } catch (Exception unused) {
            return motionEvent.getX();
        }
    }

    /* access modifiers changed from: 0000 */
    public float getActiveY(MotionEvent motionEvent) {
        try {
            return motionEvent.getY(this.mActivePointerIndex);
        } catch (Exception unused) {
            return motionEvent.getY();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0047  */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction() & 255;
        int i = 0;
        if (action != 3) {
            if (action != 6) {
                switch (action) {
                    case 0:
                        this.mActivePointerId = motionEvent.getPointerId(0);
                        break;
                    case 1:
                        break;
                }
            } else {
                int pointerIndex = Compat.getPointerIndex(motionEvent.getAction());
                if (motionEvent.getPointerId(pointerIndex) == this.mActivePointerId) {
                    int i2 = pointerIndex == 0 ? 1 : 0;
                    this.mActivePointerId = motionEvent.getPointerId(i2);
                    this.mLastTouchX = motionEvent.getX(i2);
                    this.mLastTouchY = motionEvent.getY(i2);
                }
            }
            if (this.mActivePointerId != -1) {
                i = this.mActivePointerId;
            }
            this.mActivePointerIndex = motionEvent.findPointerIndex(i);
            return super.onTouchEvent(motionEvent);
        }
        this.mActivePointerId = -1;
        if (this.mActivePointerId != -1) {
        }
        this.mActivePointerIndex = motionEvent.findPointerIndex(i);
        return super.onTouchEvent(motionEvent);
    }
}
