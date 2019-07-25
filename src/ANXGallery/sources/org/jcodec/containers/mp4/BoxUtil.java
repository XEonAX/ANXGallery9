package org.jcodec.containers.mp4;

import java.nio.ByteBuffer;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Box.LeafBox;
import org.jcodec.containers.mp4.boxes.Header;

public class BoxUtil {
    public static Box parseBox(ByteBuffer byteBuffer, Header header, IBoxFactory iBoxFactory) {
        Box newBox = iBoxFactory.newBox(header);
        if (header.getBodySize() >= 134217728) {
            return new LeafBox(Header.createHeader("free", 8));
        }
        newBox.parse(byteBuffer);
        return newBox;
    }
}
