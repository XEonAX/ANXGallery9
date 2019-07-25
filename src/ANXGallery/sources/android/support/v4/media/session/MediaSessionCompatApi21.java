package android.support.v4.media.session;

class MediaSessionCompatApi21 {

    static class QueueItem {
        public static Object getDescription(Object obj) {
            return ((android.media.session.MediaSession.QueueItem) obj).getDescription();
        }

        public static long getQueueId(Object obj) {
            return ((android.media.session.MediaSession.QueueItem) obj).getQueueId();
        }
    }
}
