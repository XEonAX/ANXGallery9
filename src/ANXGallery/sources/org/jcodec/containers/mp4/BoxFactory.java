package org.jcodec.containers.mp4;

import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Box.LeafBox;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.NodeBox;
import org.jcodec.platform.Platform;

public class BoxFactory implements IBoxFactory {
    private static IBoxFactory instance = new BoxFactory(new DefaultBoxes());
    private Boxes boxes;

    public BoxFactory(Boxes boxes2) {
        this.boxes = boxes2;
    }

    public static IBoxFactory getDefault() {
        return instance;
    }

    public Box newBox(Header header) {
        Class cls = this.boxes.toClass(header.getFourcc());
        if (cls == null) {
            return new LeafBox(header);
        }
        Box box = (Box) Platform.newInstance(cls, new Object[]{header});
        if (box instanceof NodeBox) {
            ((NodeBox) box).setFactory(this);
        }
        return box;
    }
}
