package com.google.protobuf;

import com.google.protobuf.AbstractMessage;
import com.google.protobuf.AbstractMessage.Builder;
import com.google.protobuf.MessageOrBuilder;

public class SingleFieldBuilderV3<MType extends AbstractMessage, BType extends Builder, IType extends MessageOrBuilder> implements BuilderParent {
    private BType builder;
    private boolean isClean;
    private MType message;
    private BuilderParent parent;

    public SingleFieldBuilderV3(MType mtype, BuilderParent builderParent, boolean z) {
        this.message = (AbstractMessage) Internal.checkNotNull(mtype);
        this.parent = builderParent;
        this.isClean = z;
    }

    private void onChanged() {
        if (this.builder != null) {
            this.message = null;
        }
        if (this.isClean && this.parent != null) {
            this.parent.markDirty();
            this.isClean = false;
        }
    }

    public MType build() {
        this.isClean = true;
        return getMessage();
    }

    public SingleFieldBuilderV3<MType, BType, IType> clear() {
        this.message = (AbstractMessage) (this.message != null ? this.message.getDefaultInstanceForType() : this.builder.getDefaultInstanceForType());
        if (this.builder != null) {
            this.builder.dispose();
            this.builder = null;
        }
        onChanged();
        return this;
    }

    public void dispose() {
        this.parent = null;
    }

    public BType getBuilder() {
        if (this.builder == null) {
            this.builder = (Builder) this.message.newBuilderForType(this);
            this.builder.mergeFrom((Message) this.message);
            this.builder.markClean();
        }
        return this.builder;
    }

    public MType getMessage() {
        if (this.message == null) {
            this.message = (AbstractMessage) this.builder.buildPartial();
        }
        return this.message;
    }

    public IType getMessageOrBuilder() {
        return this.builder != null ? this.builder : this.message;
    }

    public void markDirty() {
        onChanged();
    }

    public SingleFieldBuilderV3<MType, BType, IType> mergeFrom(MType mtype) {
        if (this.builder == null && this.message == this.message.getDefaultInstanceForType()) {
            this.message = mtype;
        } else {
            getBuilder().mergeFrom((Message) mtype);
        }
        onChanged();
        return this;
    }

    public SingleFieldBuilderV3<MType, BType, IType> setMessage(MType mtype) {
        this.message = (AbstractMessage) Internal.checkNotNull(mtype);
        if (this.builder != null) {
            this.builder.dispose();
            this.builder = null;
        }
        onChanged();
        return this;
    }
}
