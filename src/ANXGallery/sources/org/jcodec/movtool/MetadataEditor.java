package org.jcodec.movtool;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.jcodec.containers.mp4.MP4Util;
import org.jcodec.containers.mp4.MP4Util.Movie;
import org.jcodec.containers.mp4.boxes.MetaBox;
import org.jcodec.containers.mp4.boxes.MetaValue;
import org.jcodec.containers.mp4.boxes.NodeBox;

public class MetadataEditor {
    private Map<String, MetaValue> keyedMeta;
    private File source;

    public MetadataEditor(File file, Map<String, MetaValue> map) {
        this.source = file;
        this.keyedMeta = map;
    }

    public static MetadataEditor createFrom(File file) throws IOException {
        Movie parseFullMovie = MP4Util.parseFullMovie(file);
        MetaBox metaBox = parseFullMovie != null ? (MetaBox) NodeBox.findFirst(parseFullMovie.getMoov(), MetaBox.class, MetaBox.fourcc()) : null;
        return new MetadataEditor(file, metaBox == null ? new HashMap() : metaBox.getKeyedMeta());
    }

    public Map<String, MetaValue> getKeyedMeta() {
        return this.keyedMeta;
    }
}
