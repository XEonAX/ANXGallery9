package com.miui.gallery.photosapi;

public interface ProcessingMetadataQuery {

    public enum ProgressStatus {
        INDETERMINATE(1),
        DETERMINATE(2);
        
        private final int identifier;

        private ProgressStatus(int i) {
            this.identifier = i;
        }

        public static ProgressStatus fromIdentifier(int i) {
            return i == DETERMINATE.getIdentifier() ? DETERMINATE : INDETERMINATE;
        }

        public int getIdentifier() {
            return this.identifier;
        }
    }
}
