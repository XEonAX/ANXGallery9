package cn.kuaipan.android.kss;

public interface IKssUploadRequestResult {

    public static class Block {
        public boolean exist;
        public String meta;

        public Block(String str, boolean z) {
            this.meta = str;
            this.exist = z;
        }

        public boolean isComplete() {
            return this.exist;
        }
    }

    Block getBlock(int i);

    int getBlockCount();

    String getFileMeta();

    String[] getNodeUrls();

    byte[] getSecureKey();

    boolean isCompleted();
}
