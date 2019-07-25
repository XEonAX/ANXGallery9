package cn.kuaipan.android.kss;

import cn.kuaipan.android.http.IKscTransferListener;

public class FileTranceListener {
    private long mOffset;
    private final boolean mSendMode;
    private final IKscTransferListener mTotalListener;

    class ChunkListaner implements IKscTransferListener {
        private FileTranceListener mParent;
        private long mReceiveOffset = 0;
        private long mSendOffset = 0;

        ChunkListaner(FileTranceListener fileTranceListener, long j, long j2) {
            this.mParent = fileTranceListener;
            setSendPos(0);
            setReceivePos(0);
        }

        public void received(long j) {
            this.mParent.received(j);
            this.mReceiveOffset += j;
        }

        public void sended(long j) {
            this.mParent.sended(j);
            this.mSendOffset += j;
        }

        public void setReceivePos(long j) {
            received(j - this.mReceiveOffset);
        }

        public void setReceiveTotal(long j) {
            this.mParent.setReceiveTotal(j);
        }

        public void setSendPos(long j) {
            sended(j - this.mSendOffset);
        }

        public void setSendTotal(long j) {
            this.mParent.setSendTotal(j);
        }
    }

    public FileTranceListener(IKscTransferListener iKscTransferListener, boolean z) {
        this.mTotalListener = iKscTransferListener;
        this.mSendMode = z;
    }

    /* access modifiers changed from: private */
    public void received(long j) {
        if (this.mSendMode) {
            this.mOffset += j;
        }
        this.mTotalListener.received(j);
    }

    /* access modifiers changed from: private */
    public void sended(long j) {
        if (!this.mSendMode) {
            this.mOffset += j;
        }
        this.mTotalListener.sended(j);
    }

    public IKscTransferListener getChunkListaner(long j) {
        if (this.mSendMode) {
            ChunkListaner chunkListaner = new ChunkListaner(this, j, this.mOffset);
            return chunkListaner;
        }
        ChunkListaner chunkListaner2 = new ChunkListaner(this, this.mOffset, j);
        return chunkListaner2;
    }

    public void setReceiveTotal(long j) {
        if (this.mSendMode) {
            this.mTotalListener.setReceiveTotal(this.mOffset + j);
        }
    }

    public void setSendPos(long j) {
        if (!this.mSendMode) {
            this.mOffset = j;
        }
        this.mTotalListener.setSendPos(j);
    }

    public void setSendTotal(long j) {
        if (!this.mSendMode) {
            this.mTotalListener.setSendTotal(this.mOffset + j);
        }
    }
}
