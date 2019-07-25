.class final Lcom/miui/gallery/share/AlbumShareState$StateValue;
.super Ljava/lang/Object;
.source "AlbumShareState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/AlbumShareState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StateValue"
.end annotation


# instance fields
.field public final mDBState:Ljava/lang/String;

.field public final mShareDetailInfoRequest:I

.field public final mUIState:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareState$StateValue;->mDBState:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareState$StateValue;->mUIState:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/share/AlbumShareState$StateValue;->mShareDetailInfoRequest:I

    return-void
.end method
