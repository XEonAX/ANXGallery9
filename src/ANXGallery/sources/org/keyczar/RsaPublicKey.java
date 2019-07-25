package org.keyczar;

import com.google.gson_nex.annotations.Expose;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.Signature;
import java.security.SignatureException;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPublicKeySpec;
import javax.crypto.Cipher;
import javax.crypto.ShortBufferException;
import org.keyczar.enums.RsaPadding;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.exceptions.UnsupportedTypeException;
import org.keyczar.interfaces.EncryptingStream;
import org.keyczar.interfaces.KeyType;
import org.keyczar.interfaces.SigningStream;
import org.keyczar.interfaces.Stream;
import org.keyczar.interfaces.VerifyingStream;
import org.keyczar.util.Util;

public class RsaPublicKey extends KeyczarPublicKey {
    private static final String KEY_GEN_ALGORITHM = "RSA";
    private static final String SIG_ALGORITHM = "SHA1withRSA";
    private final byte[] hash;
    /* access modifiers changed from: private */
    public RSAPublicKey jcePublicKey;
    @Expose
    final String modulus;
    @Expose
    final RsaPadding padding;
    @Expose
    final String publicExponent;

    private class RsaStream implements EncryptingStream, VerifyingStream {
        private Cipher cipher;
        private Signature signature;

        RsaStream() throws KeyczarException {
            try {
                this.signature = Signature.getInstance(RsaPublicKey.SIG_ALGORITHM);
                this.cipher = Cipher.getInstance(RsaPublicKey.this.getPadding().getCryptAlgorithm());
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int digestSize() {
            return RsaPublicKey.this.getType().getOutputSize();
        }

        public int doFinalEncrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
            try {
                int outputSize = this.cipher.getOutputSize(byteBuffer.limit());
                int limit = byteBuffer2.limit() - byteBuffer2.position();
                ByteBuffer allocate = ByteBuffer.allocate(outputSize);
                this.cipher.doFinal(byteBuffer, allocate);
                if (outputSize == limit) {
                    byteBuffer2.put(allocate.array());
                } else if (outputSize == limit + 1 && allocate.array()[outputSize - 1] == 0) {
                    byteBuffer2.put(allocate.array(), 0, limit);
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Expected ");
                    sb.append(limit);
                    sb.append(" bytes from encryption operation but got ");
                    sb.append(outputSize);
                    throw new KeyczarException(sb.toString());
                }
                return limit;
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public SigningStream getSigningStream() {
            return new SigningStream() {
                public int digestSize() {
                    return 0;
                }

                public void initSign() {
                }

                public void sign(ByteBuffer byteBuffer) {
                }

                public void updateSign(ByteBuffer byteBuffer) {
                }
            };
        }

        public int initEncrypt(ByteBuffer byteBuffer) throws KeyczarException {
            try {
                this.cipher.init(1, RsaPublicKey.this.jcePublicKey);
                return 0;
            } catch (InvalidKeyException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public void initVerify() throws KeyczarException {
            try {
                this.signature.initVerify(RsaPublicKey.this.jcePublicKey);
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int maxOutputSize(int i) {
            return RsaPublicKey.this.getType().getOutputSize(RsaPublicKey.this.size);
        }

        public int updateEncrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
            try {
                return this.cipher.update(byteBuffer, byteBuffer2);
            } catch (ShortBufferException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public void updateVerify(ByteBuffer byteBuffer) throws KeyczarException {
            try {
                this.signature.update(byteBuffer);
            } catch (SignatureException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public boolean verify(ByteBuffer byteBuffer) throws KeyczarException {
            try {
                return this.signature.verify(byteBuffer.array(), byteBuffer.position(), byteBuffer.limit() - byteBuffer.position());
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }
    }

    private RsaPublicKey() {
        super(0);
        this.hash = new byte[4];
        this.publicExponent = null;
        this.modulus = null;
        this.padding = null;
    }

    private RsaPublicKey(BigInteger bigInteger, BigInteger bigInteger2, RsaPadding rsaPadding) {
        super(bigInteger.bitLength());
        this.hash = new byte[4];
        this.modulus = Util.encodeBigInteger(bigInteger);
        this.publicExponent = Util.encodeBigInteger(bigInteger2);
        this.padding = rsaPadding == RsaPadding.PKCS ? RsaPadding.PKCS : null;
    }

    RsaPublicKey(RSAPrivateCrtKey rSAPrivateCrtKey, RsaPadding rsaPadding) throws KeyczarException {
        this(rSAPrivateCrtKey.getModulus(), rSAPrivateCrtKey.getPublicExponent(), rsaPadding);
        initializeJceKey(rSAPrivateCrtKey.getModulus(), rSAPrivateCrtKey.getPublicExponent());
        initializeHash();
    }

    RsaPublicKey(RSAPublicKey rSAPublicKey, RsaPadding rsaPadding) throws KeyczarException {
        this(rSAPublicKey.getModulus(), rSAPublicKey.getPublicExponent(), rsaPadding);
        this.jcePublicKey = rSAPublicKey;
        initializeHash();
    }

    private void initializeHash() throws KeyczarException {
        System.arraycopy(getPadding().computeFullHash(this.jcePublicKey), 0, this.hash, 0, this.hash.length);
    }

    private void initializeJceKey(BigInteger bigInteger, BigInteger bigInteger2) throws KeyczarException {
        try {
            this.jcePublicKey = (RSAPublicKey) KeyFactory.getInstance(KEY_GEN_ALGORITHM).generatePublic(new RSAPublicKeySpec(bigInteger, bigInteger2));
        } catch (GeneralSecurityException e) {
            throw new KeyczarException((Throwable) e);
        }
    }

    static RsaPublicKey read(String str) throws KeyczarException {
        RsaPublicKey rsaPublicKey = (RsaPublicKey) Util.gson().fromJson(str, RsaPublicKey.class);
        if (rsaPublicKey.getType() == DefaultKeyType.RSA_PUB) {
            return rsaPublicKey.initFromJson();
        }
        throw new UnsupportedTypeException(rsaPublicKey.getType());
    }

    /* access modifiers changed from: protected */
    public RSAPublicKey getJceKey() {
        return this.jcePublicKey;
    }

    public RsaPadding getPadding() {
        return (this.padding == null || this.padding == RsaPadding.OAEP) ? RsaPadding.OAEP : RsaPadding.PKCS;
    }

    /* access modifiers changed from: protected */
    public Stream getStream() throws KeyczarException {
        return new RsaStream();
    }

    public KeyType getType() {
        return DefaultKeyType.RSA_PUB;
    }

    public byte[] hash() {
        return this.hash;
    }

    /* access modifiers changed from: 0000 */
    public RsaPublicKey initFromJson() throws KeyczarException {
        initializeJceKey(Util.decodeBigInteger(this.modulus), Util.decodeBigInteger(this.publicExponent));
        initializeHash();
        return this;
    }

    /* access modifiers changed from: protected */
    public boolean isSecret() {
        return false;
    }
}
