package org.jcodec.containers.mp4.boxes;

import android.support.annotation.Keep;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

@Keep
public class MetaBox extends NodeBox {
    private static final String FOURCC = "meta";

    public MetaBox(Header header) {
        super(header);
    }

    public static MetaBox createMetaBox() {
        return new MetaBox(Header.createHeader(fourcc(), 0));
    }

    public static String fourcc() {
        return FOURCC;
    }

    private DataBox getDataBox(List<Box> list) {
        for (Box box : list) {
            if (box instanceof DataBox) {
                return (DataBox) box;
            }
        }
        return null;
    }

    public Map<String, MetaValue> getKeyedMeta() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        IListBox iListBox = (IListBox) findFirst(this, IListBox.class, IListBox.fourcc());
        MdtaBox[] mdtaBoxArr = (MdtaBox[]) findAllPath(this, MdtaBox.class, new String[]{KeysBox.fourcc(), MdtaBox.fourcc()});
        if (iListBox == null || mdtaBoxArr.length == 0) {
            return linkedHashMap;
        }
        for (Entry entry : iListBox.getValues().entrySet()) {
            Integer num = (Integer) entry.getKey();
            if (num != null) {
                DataBox dataBox = getDataBox((List) entry.getValue());
                if (dataBox != null) {
                    MetaValue createOtherWithLocale = MetaValue.createOtherWithLocale(dataBox.getType(), dataBox.getLocale(), dataBox.getData());
                    if (num.intValue() > 0 && num.intValue() <= mdtaBoxArr.length) {
                        linkedHashMap.put(mdtaBoxArr[num.intValue() - 1].getKey(), createOtherWithLocale);
                    }
                }
            }
        }
        return linkedHashMap;
    }

    public void setKeyedMeta(Map<String, MetaValue> map) {
        if (!map.isEmpty()) {
            KeysBox createKeysBox = KeysBox.createKeysBox();
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            int i = 1;
            for (Entry entry : map.entrySet()) {
                createKeysBox.add(MdtaBox.createMdtaBox((String) entry.getKey()));
                MetaValue metaValue = (MetaValue) entry.getValue();
                ArrayList arrayList = new ArrayList();
                arrayList.add(DataBox.createDataBox(metaValue.getType(), metaValue.getLocale(), metaValue.getData()));
                linkedHashMap.put(Integer.valueOf(i), arrayList);
                i++;
            }
            IListBox createIListBox = IListBox.createIListBox(linkedHashMap);
            replaceBox(createKeysBox);
            replaceBox(createIListBox);
        }
    }
}
