.class public Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;
.super Landroid/widget/SeekBar;
.source "BasicSeekBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;
    }
.end annotation


# instance fields
.field private mDelegate:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;

.field private mThumb:Landroid/graphics/drawable/LayerDrawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x101007b

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;-><init>(Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mDelegate:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mDelegate:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;

    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getProgress()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->updateThumb(I)V

    return-void
.end method


# virtual methods
.method public setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mDelegate:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;->access$102(Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar$SeekBarChangeDelegate;Landroid/widget/SeekBar$OnSeekBarChangeListener;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method public setThumb(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    const v1, 0x7f090292

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    const v1, 0x7f090293

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mThumb:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getProgress()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->updateThumb(I)V

    return-void

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method updateThumb(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mThumb:Landroid/graphics/drawable/LayerDrawable;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mThumb:Landroid/graphics/drawable/LayerDrawable;

    const v0, 0x7f090293

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->mThumb:Landroid/graphics/drawable/LayerDrawable;

    const v0, 0x7f090292

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method
