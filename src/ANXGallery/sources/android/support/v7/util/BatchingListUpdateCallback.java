package android.support.v7.util;

public class BatchingListUpdateCallback implements ListUpdateCallback {
    int mLastEventCount = -1;
    Object mLastEventPayload = null;
    int mLastEventPosition = -1;
    int mLastEventType = 0;
    final ListUpdateCallback mWrapped;

    public BatchingListUpdateCallback(ListUpdateCallback listUpdateCallback) {
        this.mWrapped = listUpdateCallback;
    }

    public void dispatchLastEvent() {
        if (this.mLastEventType != 0) {
            switch (this.mLastEventType) {
                case 1:
                    this.mWrapped.onInserted(this.mLastEventPosition, this.mLastEventCount);
                    break;
                case 2:
                    this.mWrapped.onRemoved(this.mLastEventPosition, this.mLastEventCount);
                    break;
                case 3:
                    this.mWrapped.onChanged(this.mLastEventPosition, this.mLastEventCount, this.mLastEventPayload);
                    break;
            }
            this.mLastEventPayload = null;
            this.mLastEventType = 0;
        }
    }

    public void onChanged(int i, int i2, Object obj) {
        if (this.mLastEventType == 3 && i <= this.mLastEventPosition + this.mLastEventCount) {
            int i3 = i + i2;
            if (i3 >= this.mLastEventPosition && this.mLastEventPayload == obj) {
                int i4 = this.mLastEventPosition + this.mLastEventCount;
                this.mLastEventPosition = Math.min(i, this.mLastEventPosition);
                this.mLastEventCount = Math.max(i4, i3) - this.mLastEventPosition;
                return;
            }
        }
        dispatchLastEvent();
        this.mLastEventPosition = i;
        this.mLastEventCount = i2;
        this.mLastEventPayload = obj;
        this.mLastEventType = 3;
    }

    public void onInserted(int i, int i2) {
        if (this.mLastEventType != 1 || i < this.mLastEventPosition || i > this.mLastEventPosition + this.mLastEventCount) {
            dispatchLastEvent();
            this.mLastEventPosition = i;
            this.mLastEventCount = i2;
            this.mLastEventType = 1;
            return;
        }
        this.mLastEventCount += i2;
        this.mLastEventPosition = Math.min(i, this.mLastEventPosition);
    }

    public void onMoved(int i, int i2) {
        dispatchLastEvent();
        this.mWrapped.onMoved(i, i2);
    }

    public void onRemoved(int i, int i2) {
        if (this.mLastEventType != 2 || this.mLastEventPosition < i || this.mLastEventPosition > i + i2) {
            dispatchLastEvent();
            this.mLastEventPosition = i;
            this.mLastEventCount = i2;
            this.mLastEventType = 2;
            return;
        }
        this.mLastEventCount += i2;
        this.mLastEventPosition = i;
    }
}
