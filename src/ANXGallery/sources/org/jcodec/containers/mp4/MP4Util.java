package org.jcodec.containers.mp4;

import com.miui.gallery.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jcodec.common.io.FileChannelWrapper;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.FileTypeBox;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;

public class MP4Util {

    public static class Atom {
        private Header header;
        private long offset;

        public Atom(Header header2, long j) {
            this.header = header2;
            this.offset = j;
        }

        public Header getHeader() {
            return this.header;
        }

        public Box parseBox(SeekableByteChannel seekableByteChannel) throws IOException {
            seekableByteChannel.setPosition(this.offset + this.header.headerSize());
            return BoxUtil.parseBox(NIOUtils.fetchFromChannel(seekableByteChannel, (int) this.header.getBodySize()), this.header, BoxFactory.getDefault());
        }
    }

    public static class Movie {
        private FileTypeBox ftyp;
        private MovieBox moov;

        public Movie(FileTypeBox fileTypeBox, MovieBox movieBox) {
            this.ftyp = fileTypeBox;
            this.moov = movieBox;
        }

        public MovieBox getMoov() {
            return this.moov;
        }
    }

    public static List<Atom> getRootAtoms(SeekableByteChannel seekableByteChannel) throws IOException {
        long j = 0;
        seekableByteChannel.setPosition(0);
        ArrayList arrayList = new ArrayList();
        while (j < seekableByteChannel.size()) {
            seekableByteChannel.setPosition(j);
            Header read = Header.read(NIOUtils.fetchFromChannel(seekableByteChannel, 16));
            if (read == null) {
                break;
            }
            arrayList.add(new Atom(read, j));
            j += read.getSize();
        }
        return arrayList;
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0014  */
    public static Movie parseFullMovie(File file) throws IOException {
        FileChannelWrapper fileChannelWrapper;
        try {
            fileChannelWrapper = NIOUtils.readableChannel(file);
            try {
                Movie parseFullMovieChannel = parseFullMovieChannel(fileChannelWrapper);
                if (fileChannelWrapper != null) {
                    fileChannelWrapper.close();
                }
                return parseFullMovieChannel;
            } catch (Throwable th) {
                th = th;
                if (fileChannelWrapper != null) {
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            fileChannelWrapper = null;
            if (fileChannelWrapper != null) {
                fileChannelWrapper.close();
            }
            throw th;
        }
    }

    public static Movie parseFullMovieChannel(SeekableByteChannel seekableByteChannel) throws IOException {
        FileTypeBox fileTypeBox = null;
        for (Atom atom : getRootAtoms(seekableByteChannel)) {
            if ("ftyp".equals(atom.getHeader().getFourcc())) {
                long bodySize = atom.getHeader().getBodySize();
                if (bodySize >= 1024) {
                    Log.w("jcodec", "Ftyp body size %d is too large.", Long.valueOf(bodySize));
                    return null;
                }
                fileTypeBox = (FileTypeBox) atom.parseBox(seekableByteChannel);
            } else if ("moov".equals(atom.getHeader().getFourcc())) {
                long bodySize2 = atom.getHeader().getBodySize();
                if (bodySize2 < 131072) {
                    return new Movie(fileTypeBox, (MovieBox) atom.parseBox(seekableByteChannel));
                }
                Log.w("jcodec", "Moov body size %d is too large.", Long.valueOf(bodySize2));
                return null;
            }
        }
        return null;
    }
}
