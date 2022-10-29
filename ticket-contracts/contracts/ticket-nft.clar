;; ticket-nft
;; <add a description here>
(impl-trait .nft-contract.nft-trait)

;; constants
;;
(define-constant CONTRACT_OWNER tx-sender)
(define-constant MAXIMUM_TICKET_QTY u50)
;; Set base price f
(define-constant TICKET_PRICE u35)

;; ERRORS
(define-constant ERR_NOT_OWNER (err u102))
(define-constant ERR_NOT_ENOUGH_STX (err u103))
(define-constant ERR_ALL_TICKETS_PURCHASED (err u104))
(define-constant ERR_TICKET_SALES_UNAVAILABLE (err u105))

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
(define-public (mint)
  (let
    (
      (new-token-id (+ (var-get last-token-id) u1))
    )
      (asserts! (is-eq true (var-get is-sales-allowed)) ERR_TICKET_SALES_UNAVAILABLE)
      (asserts! (>= (stx-get-balance tx-sender) TICKET_PRICE) ERR_NOT_ENOUGH_STX)
      (asserts! (>= new-token-id MAXIMUM_TICKET_QTY) ERR_ALL_TICKETS_PURCHASED)
      (nft-mint? tickets new-token-id tx-sender)
  )
)

(define-public (transfer (token-id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq true (var-get is-sales-allowed)) ERR_TICKET_SALES_UNAVAILABLE)
    (asserts! (is-eq sender tx-sender) ERR_NOT_OWNER)
    (nft-transfer? tickets token-id sender recipient)
  )
)


;; private functions
;;
