.class Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$3;
.super Ljava/lang/Object;
.source "FilterFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$800(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;I)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
