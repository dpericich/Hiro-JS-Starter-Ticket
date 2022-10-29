;; ticket-nft
;; <add a description here>
(impl-trait .nft-contract.nft-trait)

;; constants
;;
(define-constant CONTRACT_OWNER tx-sender)
(define-constant MAXIMUM_TICKET_QTY u50)
(define-constant TICKET_PRICE u35)

;; error constants
(define-constant ERR_OWNER_ONLY (err u101))
(define-constant ERR_NOT_OWNER (err u102))
(define-constant ERR_NOT_ENOUGH_STX (err u103))
(define-constant ERR_ALL_TICKETS_PURCHASED (err u104))
(define-constant ERR_TICKET_SALES_UNAVAILABLE (err u105))
(define-constant ERR_PAYMENT (err u106))

;; data maps and vars
;;
(define-data-var last-token-id uint u1)
(define-data-var is-sales-allowed bool true)
(define-non-fungible-token tickets uint)

;; read-only functions
;;
(define-read-only (get-last-token-id)
  (ok (var-get last-token-id))
)

(define-read-only (get-token-uri (token-id uint))
  (ok none)
)

(define-read-only (get-owner (token-id uint))
  (ok (nft-get-owner? tickets token-id))
)

;; public functions
;;
(define-public (mint (recipient principal))
  (let
    (
      (new-token-id (+ (var-get last-token-id) u1))
    )
      (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_OWNER_ONLY)
      (asserts! (is-eq true (var-get is-sales-allowed)) ERR_TICKET_SALES_UNAVAILABLE)
      (asserts! (>= (stx-get-balance recipient) TICKET_PRICE) ERR_NOT_ENOUGH_STX)
      (asserts! (>= MAXIMUM_TICKET_QTY new-token-id) ERR_ALL_TICKETS_PURCHASED)
      (try! (stx-transfer? TICKET_PRICE tx-sender recipient))
      (var-set last-token-id new-token-id)
      (nft-mint? tickets new-token-id recipient)
  )
)

(define-public (transfer (token-id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq true (var-get is-sales-allowed)) ERR_TICKET_SALES_UNAVAILABLE)
    (asserts! (is-eq sender tx-sender) ERR_NOT_OWNER)
    (nft-transfer? tickets token-id sender recipient)
  )
)

(define-public (stop-sales)
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_OWNER_ONLY)
    (ok (var-set is-sales-allowed false))
  )
)


;; private functions
;;
