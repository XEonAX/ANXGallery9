package cn.kuaipan.android.http;

import android.util.Log;

public interface IKscTransferListener {

    public static abstract class KscTransferListener implements IKscTransferListener {
        private long receiveTotal = -1;
        private long received = 0;
        private long sendTotal = -1;
        private long sended = 0;

        public abstract void onDataReceived(long j, long j2);

        public abstract void onDataSended(long j, long j2);

        public final void received(long j) {
            this.received += j;
            try {
                onDataReceived(this.received, this.receiveTotal);
            } catch (Error e) {
                throw e;
            } catch (Throwable th) {
                Log.e("KscTransferListener", "Meet exception in onDataReceived()", th);
            }
        }

        public final void sended(long j) {
            this.sended += j;
            try {
                onDataSended(this.sended, this.sendTotal);
            } catch (Error e) {
                throw e;
            } catch (Throwable th) {
                Log.e("KscTransferListener", "Meet exception in onDataSended()", th);
            }
        }

        public final void setReceivePos(long j) {
            if (j != this.received) {
                this.received = j;
                onDataReceived(this.received, this.receiveTotal);
            }
        }

        public final void setReceiveTotal(long j) {
            this.receiveTotal = j;
        }

        public final void setSendPos(long j) {
            if (j != this.sended) {
                this.sended = j;
                onDataSended(this.sended, this.sendTotal);
            }
        }

        public final void setSendTotal(long j) {
            this.sendTotal = j;
        }
    }

    void received(long j);

    void sended(long j);

    void setReceivePos(long j);

    void setReceiveTotal(long j);

    void setSendPos(long j);

    void setSendTotal(long j);
}
