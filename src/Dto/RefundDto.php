<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Refunds\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class RefundDto {
    public function __construct(
        public readonly ?int $id,
        public readonly int $paymentId,
        public readonly string $amount,
        public readonly string $currency,
        public readonly ?string $reason,
        public readonly string $status,
        public readonly \DateTimeImmutable $createdAt,
        public readonly array|null $details
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
