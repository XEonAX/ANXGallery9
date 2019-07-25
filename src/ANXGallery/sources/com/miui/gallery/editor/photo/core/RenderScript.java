package com.miui.gallery.editor.photo.core;

import android.util.ArrayMap;
import android.util.Property;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.List;
import java.util.Map;

public class RenderScript {
    public static final Dispatcher DISPATCHER = new Dispatcher();

    public static final class Dispatcher {
        private Translator[] mTranslators = new Translator[Effect.values().length];

        Dispatcher() {
        }
    }

    public static abstract class JsonProperty<T, V> extends Property<T, V> {
        public JsonProperty(Class<V> cls, String str) {
            super(cls, str);
        }
    }

    public static abstract class Translator<T extends RenderData> {
        private final Map<String, JsonProperty<T, ?>> mProperties;

        protected Translator(List<JsonProperty<T, ?>> list) {
            this.mProperties = new ArrayMap(list.size() + 1);
            for (JsonProperty jsonProperty : list) {
                this.mProperties.put(jsonProperty.getName(), jsonProperty);
            }
            if (this.mProperties.get(nexExportFormat.TAG_FORMAT_TYPE) == null) {
                this.mProperties.put(nexExportFormat.TAG_FORMAT_TYPE, new Type());
                return;
            }
            throw new IllegalArgumentException("can't use 'type' for property.");
        }
    }

    private static final class Type<T extends RenderData> extends JsonProperty<T, Effect> {
        public Type() {
            super(Effect.class, nexExportFormat.TAG_FORMAT_TYPE);
        }

        public Effect get(RenderData renderData) {
            return renderData.mType;
        }

        public void set(RenderData renderData, Effect effect) {
            renderData.mType = effect;
        }
    }
}
