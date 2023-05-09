.model small
.stack 100h
.386

.data
CRLF            db 0dh, 0ah, "$"
SPC             db 20h, "$"
pressAnyKeyMsg  db 10,13,"Press any key to return to the main menu...$"

; Menu options
menuMsg         db 10,13,"+-------------------------------------------+"
                db 10,13,"|         APU Mart Inventory System         |"
                db 10,13,"+-------------------------------------------+"
                db 10,13,"| 1. List all inventory items               |"
                db 10,13,"| 2. List finished goods                    |"
                db 10,13,"| 3. List items that needs to be ordered    |"
                db 10,13,"| 4. Order items from a vendor              |"
                db 10,13,"| 5. Sell items                             |"
                db 10,13,"| 6. Exit program                           |"
                db 10,13,"+-------------------------------------------+"
                db 10,13,"Please insert your option> $"

menuErr         db 10,13,"Invalid Input. Please Insert {1-6}: $"

; Variables for inventory items
waffle db 5
soda db 2
biscuit db 2
noodle db 0
gum db 11
coffee db 0

;Messages for different lists
listAllHeader   db 10,13,"+-------------------------------+"
                db 10,13,"|      All Inventory Items      |"
                db 10,13,"+-------------------------------+"
                db 10,13,"Item Name   :   Inventory Count$"

waffleRow       db 10,13,"Waffle      :   $"
sodaRow         db 10,13,"Soda        :   $"
biscuitRow      db 10,13,"Biscuit     :   $"
noodleRow       db 10,13,"Noodle      :   $"
gumRow          db 10,13,"Gum         :   $"
coffeeRow       db 10,13,"Coffee      :   $"

finishHeader    db 10,13,"+--------------------+"
                db 10,13,"|   Finished Goods   |"
                db 10,13,"+--------------------+"
                db 10,13,"Item: Inventory Count$"

noFinishMsg     db 10,13,"No items have 0 quantity$"

waffleZero      db 10,13,"Waffle   :   0$"
sodaZero        db 10,13,"Soda     :   0$"
biscuitZero     db 10,13,"Biscuit  :   0$"
noodleZero      db 10,13,"Noodle   :   0$"
gumZero         db 10,13,"Gum      :   0$"
coffeeZero      db 10,13,"Coffee   :   0$"

lowStockHeader  db 10,13,"+-------------------------------------+"
                db 10,13,"|         Low Inventory Goods         |"
                db 10,13,"+-------------------------------------+"
                db 10,13,"Items with Inventory Count Less Than 5$"

noLowMsg        db 10,13,"No items less than 5$"

orderHeader     db 10,13,"+-------------------------------------+"
                db 10,13,"|       Order Goods From Vendor       |"
                db 10,13,"+-------------------------------------+"
                db 10,13,"Select an item below to order."
                db 10,13,"Item Name   :   Inventory Count$"

waffleRowList  db 10,13,"1. Waffle   :   $"
sodaRowList    db 10,13,"2. Soda     :   $"
biscuitRowList db 10,13,"3. Biscuit  :   $"
noodleRowList  db 10,13,"4. Noodle   :   $"
gumRowList     db 10,13,"5. Gum      :   $"
coffeeRowList  db 10,13,"6. Coffee   :   $"

orderOpt        db 10,13,"+-------------------------------------+"
                db 10,13,"| 1. Order                            |"
                db 10,13,"| 2. Exit                             |"
                db 10,13,"+-------------------------------------+"
                db 10,13,"Please insert your option> $"

orderErr        db 10,13,"Invalid Input. Please Insert {1 or 2}: $"

orderItemNum    db 10,13,"Enter the item number to order> $"
orderItemErr    db 10,13,"Invalid Input. Please Insert {1-6}> $"

orderWaffleMsg  db 10,13,"Enter the amount of waffle(s) to order> $"
orderSodaMsg    db 10,13,"Enter the amount of soda(s) to order> $"
orderBiscuitMsg db 10,13,"Enter the amount of biscuit(s) to order> $"
orderNoodleMsg  db 10,13,"Enter the amount of noodle(s) to order> $"
orderGumMsg     db 10,13,"Enter the amount of gum(s) to order> $"
orderCoffeeMsg  db 10,13,"Enter the amount of coffee(s) to order> $"

amountOrderErr  db 10,13,"Invalid Input. Please order 1 to 9 count of item> $"

doneWaffleMsg   db 10,13,"Waffle(s) successfully added into inventory. Press any key to refresh inventory..$"
doneSodaMsg     db 10,13,"Soda(s) successfully added into inventory. Press any key to refresh inventory..$"
doneBiscuitMsg  db 10,13,"Biscuit(s) successfully added into inventory. Press any key to refresh inventory..$"
doneNoodleMsg   db 10,13,"Noodle(s) successfully added into inventory. Press any key to refresh inventory..$"
doneGumMsg      db 10,13,"Gum(s) successfully added into inventory. Press any key to refresh inventory..$"
doneCoffeeMsg   db 10,13,"Coffee(s) successfully added into inventory. Press any key to refresh inventory..$"

sellHeader      db 10,13,"+------------------------------------+"
                db 10,13,"|             Sell Items             |"
                db 10,13,"+------------------------------------+"
                db 10,13,"Select an item below to sell."
                db 10,13,"Item Name   :   Inventory Count$"

sellOpt         db 10,13,"+-------------------------------------+"
                db 10,13,"| 1. Sell                             |"
                db 10,13,"| 2. Exit                             |"
                db 10,13,"+-------------------------------------+"
                db 10,13,"Please insert your option> $"

sellErr         db 10,13,"Invalid Input. Please Insert {1 or 2}: $"

sellItemNum     db 10,13,"Enter the item number to sell> $"
sellItemErr     db 10,13,"Invalid Input. Please Insert {1-6}> $"

sellWaffleMsg   db 10,13,"Enter the amount of waffle(s) to sell> $"
sellSodaMsg     db 10,13,"Enter the amount of soda(s) to sell> $"
sellBiscuitMsg  db 10,13,"Enter the amount of biscuit(s) to sell> $"
sellNoodleMsg   db 10,13,"Enter the amount of noodle(s) to sell> $"
sellGumMsg      db 10,13,"Enter the amount of gum(s) to sell> $"
sellCoffeeMsg   db 10,13,"Enter the amount of coffee(s) to sell> $"

doneWaffleSale  db 10,13,"Waffle(s) successfully deducted from inventory. Press any key to refresh inventory..$"
doneSodaSale    db 10,13,"Soda(s) successfully deducted from inventory. Press any key to refresh inventory..$"
doneBiscuitSale db 10,13,"Biscuit(s) successfully deducted from inventory. Press any key to refresh inventory..$"
doneNoodleSale  db 10,13,"Noodle(s) successfully deducted from inventory. Press any key to refresh inventory..$"
doneGumSale     db 10,13,"Gum(s) successfully deducted from inventory. Press any key to refresh inventory..$"
doneCoffeeSale  db 10,13,"Coffee(s) successfully deducted from inventory. Press any key to refresh inventory..$"

noWaffleErr     db 10,13,"Not enough Waffle(s) in the inventory. Please look at the Waffle available.$"
noSodaErr       db 10,13,"Not enough Soda(s) in the inventory. Please look at the Soda available.$"
noBiscuitErr    db 10,13,"Not enough Biscuit(s) in the inventory. Please look at the Biscuit available.$"
noNoodleErr     db 10,13,"Not enough Noodle(s) in the inventory. Please look at the Noodle available.$"
noGumErr        db 10,13,"Not enough Gum(s) in the inventory. Please look at the Gum available.$"
noCoffeeErr     db 10,13,"Not enough Coffee(s) in the inventory. Please look at the Coffee available.$"

.code
; Macro to convert Binary Coded Decimal (BCD) to binary
convertBCDToBinary macro
        ; Adjusts the ASCII result in AX to convert it to binary
        aam
        add ax, 3030h
        ; Stores the result in BX and sets AH to 0
        mov bx, ax
        mov ah, 0
endm

; Converts a numeric value in ASCII format and prints it to the console.
printAsciiDigits macro
        add al, '0'
        mov dl, al
        mov ah, 02h
        int 21h
endm

; Macro to save registers
save macro
        ; Pushes AX, BX, CX, and DX onto the stack
        push ax
        push bx
        push cx
        push dx
endm

; Macro to restore registers
restore macro
        ; Pops DX, CX, BX, and AX from the stack
        pop dx
        pop cx
        pop bx
        pop ax
endm

Main proc
        call ClearScreen

        mov ax, @data
        mov ds, ax

        mov ah, 09h ; display string function
        lea dx, menuMsg ; load offset of the string to be displayed
        int 21h ; call interrupt to display string

        ; Wait and read user input
        getMenuInput:
                mov ah, 01h
                int 21h

                ; Check user input and call appropriate function
                cmp al, '1'
                ; if al == '1', jump to listAll
                je listAll
                cmp al, '2'
                ; if al == '2', jump to listFinished
                je listFinished
                cmp al, '3'
                ; if al == '3', jump to lowInventory
                je lowInventory
                cmp al, '4'
                ; if al == '4', jump to orderFromVendor
                je orderFromVendor
                cmp al, '5'
                ; if al == '5', jump to orderFromVendor
                je sellItemMenu
                cmp al, '6'
                ; if al == '6', jump to exitProgram
                je exitProgram
                ; if none of the above conditions were met, jump to invalidInput
                jne invalidInput

; Functions for each menu option
; Print list of all inventory items
listAll:
        ; Display all items name and amount
        call ClearScreen
        mov dx, offset listAllHeader ; load offset of the string to be displayed
        mov ah, 09h ; display string function
        int 21h ; call interrupt to display string

        ; Display item names and their respective inventory count
        mov al, waffle
        convertBCDToBinary
        mov dx, offset waffleRow
        call listAllDisplay

        mov al, soda
        convertBCDToBinary
        mov dx, offset sodaRow
        call listAllDisplay

        mov al, biscuit
        convertBCDToBinary
        mov dx, offset biscuitRow
        call listAllDisplay

        mov al, noodle
        convertBCDToBinary
        mov dx, offset noodleRow
        call listAllDisplay

        mov al, gum
        convertBCDToBinary
        mov dx, offset gumRow
        call listAllDisplay

        mov al, coffee
        convertBCDToBinary
        mov dx, offset coffeeRow
        call listAllDisplay
        jmp returnToMenu

listFinished:
        ; Clears the screen
        call ClearScreen

        ; Displays a header for the finished items table
        mov dx, offset finishHeader
        mov ah, 09h
        int 21h

        ; Sets the counter register CX to 0
        mov cx, 0

        ; Starts a loop to check if each inventory count for each item is zero
        checkWaffle:
                cmp waffle, 0
                ; If the inventory count for waffles is zero, display the message and increment the counter register CX
                jne checkSoda
                mov dx, offset waffleZero
                call listFinishedDisplay
                inc cx
                jmp checkSoda

        checkSoda:
                cmp soda, 0
                ; If the inventory count for soda is zero, display the message and increment the counter register CX
                jne checkBiscuit
                mov dx, offset sodaZero
                call listFinishedDisplay
                inc cx
                jmp checkBiscuit

        checkBiscuit:
                cmp biscuit, 0
                ; If the inventory count for biscuits is zero, display the message and increment the counter register CX
                jne checkNoodle
                mov dx, offset biscuitZero
                call listFinishedDisplay
                inc cx
                jmp checkNoodle

        checkNoodle:
                cmp noodle, 0
                ; If the inventory count for noodles is zero, display the message and increment the counter register CX
                jne checkGum
                mov dx, offset noodleZero
                call listFinishedDisplay
                inc cx
                jmp checkGum

        checkGum:
                cmp gum, 0
                ; If the inventory count for gum is zero, display the message and increment the counter register CX
                jne checkCoffee
                mov dx, offset gumZero
                call listFinishedDisplay
                inc cx
                jmp checkCoffee

        checkCoffee:
                cmp coffee, 0
                ; If the inventory count for coffee is zero, display the message and increment the counter register CX
                jne finishEnd
                mov dx, offset coffeeZero
                call listFinishedDisplay
                inc cx

        finishEnd:
                ; If all items have a nonzero inventory count, display a message
                cmp cx, 0
                jne returnToMenu
                mov dx, offset noFinishMsg
                call listFinishedDisplay

        ; Return to main menu
        jmp returnToMenu

        listFinishedDisplay:
        ; Displays the message stored in the DX register and returns.
                save
                mov ah, 09h
                int 21h
                restore
                ret

lowInventory:
        ; Clear the screen
        call ClearScreen
        ; Display header of table
        mov dx, offset lowStockHeader
        mov ah, 09h
        int 21h

        ; set counter to 0
        mov cx, 0

        ; loop through each item and check if inventory count is less than or equals to 5
        checkWaffles:
                cmp waffle, 5
                jle printWaffles
                jg checkSodas
                inc cx
                jmp checkSodas

        checkSodas:
                cmp soda, 5
                jle printSodas
                jg checkBiscuits
                inc cx
                jmp checkBiscuits

        checkBiscuits:
                cmp biscuit, 5
                jle printBiscuits
                jg checkNoodles
                inc cx
                jmp checkNoodles

        checkNoodles:
                cmp noodle, 5
                jle printNoodles
                jg checkGums
                inc cx
                jmp checkGums

        checkGums:
                cmp gum, 5
                jle printGums
                jg checkCoffees
                inc cx
                jmp checkCoffees

        checkCoffees:
                cmp coffee, 5
                jle printCoffees
                jg finishEnds
                inc cx

        printWaffles:
                ; Move the value of the apple variable into the AL register
                mov al, waffle

                ; Display the message string
                mov ah, 09h
                mov dx, offset waffleRow
                int 21h
                printAsciiDigits
                inc cx
                jmp checkSodas

        printSodas:
                mov al, soda

                ; Display the message string
                mov ah, 09h
                mov dx, offset sodaRow
                int 21h
                printAsciiDigits
                inc cx
                jmp checkBiscuits

        printBiscuits:
                mov al, biscuit

                ; Display the message string
                mov ah, 09h
                mov dx, offset biscuitRow
                int 21h
                printAsciiDigits
                inc cx
                jmp checkNoodles

        printNoodles:
                mov al, noodle

                ; Display the message string
                mov ah, 09h
                mov dx, offset noodleRow
                int 21h
                printAsciiDigits
                inc cx
                jmp checkGums

        printGums:
                mov al, gum

                ; Display the message string
                mov ah, 09h
                mov dx, offset gumRow
                int 21h
                printAsciiDigits
                inc cx
                jmp checkCoffees

        printCoffees:
                mov al, coffee

                ; Display the message string
                mov ah, 09h
                mov dx, offset coffeeRow

                int 21h
                printAsciiDigits
                inc cx
                jmp finishEnds

        finishEnds:
                cmp cx, 0
                jmp returnToMenu
                mov dx, offset noLowMsg
                call finishedDisplays

        ; Return to main menu
        jmp returnToMenu

        finishedDisplays:
                mov ah, 09h
                int 21h
                ret

orderFromVendor:
        ; Display all items name and amount
        call ClearScreen
        mov dx, offset orderHeader ; load offset of the string to be displayed
        mov ah, 09h ; display string function
        int 21h ; call interrupt to display string

        ; Display item names and their respective inventory count
        mov al, waffle
        convertBCDToBinary
        mov dx, offset waffleRowList
        call listAllDisplay

        mov al, soda
        convertBCDToBinary
        mov dx, offset sodaRowList
        call listAllDisplay

        mov al, biscuit
        convertBCDToBinary
        mov dx, offset biscuitRowList
        call listAllDisplay

        mov al, noodle
        convertBCDToBinary
        mov dx, offset noodleRowList
        call listAllDisplay

        mov al, gum
        convertBCDToBinary
        mov dx, offset gumRowList
        call listAllDisplay

        mov al, coffee
        convertBCDToBinary
        mov dx, offset coffeeRowList
        call listAllDisplay

        orderLoop:
                ; Prompt user to order or exit
                mov ah, 09h ; display string function
                mov dx, offset orderOpt ; load offset of the string to be displayed
                int 21h ; call interrupt to display string

                ; Wait and read user input
                getOrderOptInput:
                        mov ah, 01h
                        int 21h

                        ; Input validation 1 or 2
                        cmp al, '1'
                        je orderItem
                        cmp al, '2'
                        je returnToMenu
                        jne invalidOrderOptInput

        orderItem:
                ; Prompt item number to order
                mov ah, 09h ; display string function
                mov dx, offset orderItemNum ; load offset of the string to be displayed
                int 21h ; call interrupt to display string

                ; Wait and read user input
                getItemNumber:
                        mov ah, 01h
                        int 21h

                        ; Check user input and call appropriate function
                        cmp al, '1'
                        ; If al == '1', jump to orderWaffle
                        je orderWaffle
                        cmp al, '2'
                        ; If al == '2', jump to orderSoda
                        je orderSoda
                        cmp al, '3'
                        ; If al == '3', jump to orderBiscuit
                        je orderBiscuit
                        cmp al, '4'
                        ; If al == '4', jump to orderNoodle
                        je orderNoodle
                        cmp al, '5'
                        ; If al == '5', jump to orderGum
                        je orderGum
                        cmp al, '6'
                        ; If al == '6', jump to orderCoffee
                        je orderCoffee
                        ; If none of the above conditions were met, jump to invalidInput
                        jne invalidOrderNumInput

                orderWaffle:
                        ; Display prompt for how many waffles to order
                        mov ah, 09h
                        mov dx, offset orderWaffleMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput1:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput1
                                cmp al, 9
                                jg invalidAmountInput1
                                mov cl, al
                                ; add item into inventory
                                add waffle, cl

                                ; Display success order message
                                mov ah, 09
                                mov dx, offset doneWaffleMsg ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp orderFromVendor

                orderSoda:
                        ; Display prompt for how many waffles to order
                        mov ah, 09h
                        mov dx, offset orderSodaMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput2:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput2
                                cmp al, 9
                                jg invalidAmountInput2
                                mov cl, al
                                ; add item into inventory
                                add soda, cl

                                ; Display success order message
                                mov ah, 09
                                mov dx, offset doneSodaMsg ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp orderFromVendor

                orderBiscuit:
                        ; Display prompt for how many waffles to order
                        mov ah, 09h
                        mov dx, offset orderBiscuitMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput3:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput3
                                cmp al, 9
                                jg invalidAmountInput3
                                mov cl, al
                                ; add item into inventory
                                add biscuit, cl

                                ; Display success order message
                                mov ah, 09
                                mov dx, offset doneBiscuitMsg ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp orderFromVendor

                orderNoodle:
                        ; Display prompt for how many waffles to order
                        mov ah, 09h
                        mov dx, offset orderNoodleMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput4:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput4
                                cmp al, 9
                                jg invalidAmountInput4
                                mov cl, al
                                ; add item into inventory
                                add noodle, cl

                                ; Display success order message
                                mov ah, 09
                                mov dx, offset doneNoodleMsg ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp orderFromVendor

                orderGum:
                        ; Display prompt for how many waffles to order
                        mov ah, 09h
                        mov dx, offset orderGumMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput5:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput5
                                cmp al, 9
                                jg invalidAmountInput5
                                mov cl, al
                                ; add item into inventory
                                add gum, cl

                                ; Display success order message
                                mov ah, 09
                                mov dx, offset doneGumMsg ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp orderFromVendor

                orderCoffee:
                        ; Display prompt for how many waffles to order
                        mov ah, 09h
                        mov dx, offset orderCoffeeMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput6:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput6
                                cmp al, 9
                                jg invalidAmountInput6
                                mov cl, al
                                ; add item into inventory
                                add coffee, cl

                                ; Display success order message
                                mov ah, 09
                                mov dx, offset doneCoffeeMsg ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp orderFromVendor

        ; return to main menu
        jmp returnToMenu

sellItemMenu:
        ; Display all items name and amount
        call ClearScreen
        mov dx, offset sellHeader ; load offset of the string to be displayed
        mov ah, 09h ; display string function
        int 21h ; call interrupt to display string

        ; Display item names and their respective inventory count
        mov al, waffle
        convertBCDToBinary
        mov dx, offset waffleRowList
        call listAllDisplay

        mov al, soda
        convertBCDToBinary
        mov dx, offset sodaRowList
        call listAllDisplay

        mov al, biscuit
        convertBCDToBinary
        mov dx, offset biscuitRowList
        call listAllDisplay

        mov al, noodle
        convertBCDToBinary
        mov dx, offset noodleRowList
        call listAllDisplay

        mov al, gum
        convertBCDToBinary
        mov dx, offset gumRowList
        call listAllDisplay

        mov al, coffee
        convertBCDToBinary
        mov dx, offset coffeeRowList
        call listAllDisplay

        sellLoop:
                ; Prompt user to order or exit
                mov ah, 09h ; display string function
                mov dx, offset sellOpt ; load offset of the string to be displayed
                int 21h ; call interrupt to display string

                ; Wait and read user input
                getSellOptInput:
                        mov ah, 01h
                        int 21h

                        ; Input validation 1 or 2
                        cmp al, '1'
                        je sellItem
                        cmp al, '2'
                        je returnToMenu
                        jne invalidSellOptInput

        sellItem:
                ; Prompt item number to sell
                mov ah, 09h ; display string function
                mov dx, offset sellItemNum ; load offset of the string to be displayed
                int 21h ; call interrupt to display string

                ; Wait and read user input
                getItemNumber1:
                        mov ah, 01h
                        int 21h

                        ; Check user input and call appropriate function
                        cmp al, '1'
                        ; If al == '1', jump to sellWaffle
                        je sellWaffle
                        cmp al, '2'
                        ; If al == '2', jump to sellSoda
                        je sellSoda
                        cmp al, '3'
                        ; If al == '3', jump to sellBiscuit
                        je sellBiscuit
                        cmp al, '4'
                        ; If al == '4', jump to sellNoodle
                        je sellNoodle
                        cmp al, '5'
                        ; If al == '5', jump to sellGum
                        je sellGum
                        cmp al, '6'
                        ; If al == '6', jump to sellCoffee
                        je sellCoffee
                        ; If none of the above conditions were met, jump to invalidInput
                        jne invalidSellNumInput

                sellWaffle:
                        ; Display prompt for how many waffles to sell
                        mov ah, 09h
                        mov dx, offset sellWaffleMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput7:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput7
                                cmp al, 9
                                jg invalidAmountInput7
                                mov cl, al

                                ; Validation to check item amount
                                cmp cl, waffle ; check if enough waffle
                                ja notEnoughWaffles ; Jump if input more than inventory
                                ; subtract item from inventory
                                sub waffle, cl

                                ; Display success sell message
                                mov ah, 09
                                mov dx, offset doneWaffleSale ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp sellItemMenu

                sellSoda:
                        ; Display prompt for how many waffles to sell
                        mov ah, 09h
                        mov dx, offset sellSodaMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput8:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput8
                                cmp al, 9
                                jg invalidAmountInput8
                                mov cl, al

                                ; Validation to check item amount
                                cmp cl, soda ; check if enough waffle
                                ja notEnoughSodas ; Jump if input more than inventory
                                ; subtract item from inventory
                                sub soda, cl

                                ; Display success sell message
                                mov ah, 09
                                mov dx, offset doneSodaSale ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp sellItemMenu

                sellBiscuit:
                        ; Display prompt for how many waffles to sell
                        mov ah, 09h
                        mov dx, offset sellBiscuitMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput9:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput9
                                cmp al, 9
                                jg invalidAmountInput9
                                mov cl, al

                                ; Validation to check item amount
                                cmp cl, biscuit ; check if enough waffle
                                ja notEnoughBiscuits ; Jump if input more than inventory
                                ; subtract item from inventory
                                sub biscuit, cl

                                ; Display success sell message
                                mov ah, 09
                                mov dx, offset doneBiscuitSale ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp sellItemMenu

                sellNoodle:
                        ; Display prompt for how many waffles to sell
                        mov ah, 09h
                        mov dx, offset sellNoodleMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput10:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput10
                                cmp al, 9
                                jg invalidAmountInput10
                                mov cl, al

                                ; Validation to check item amount
                                cmp cl, noodle ; check if enough waffle
                                ja notEnoughNoodles ; Jump if input more than inventory
                                ; subtract item from inventory
                                sub noodle, cl

                                ; Display success sell message
                                mov ah, 09
                                mov dx, offset doneNoodleSale ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp sellItemMenu

                sellGum:
                        ; Display prompt for how many waffles to sell
                        mov ah, 09h
                        mov dx, offset sellGumMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput11:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput11
                                cmp al, 9
                                jg invalidAmountInput11
                                mov cl, al

                                ; Validation to check item amount
                                cmp cl, gum ; check if enough waffle
                                ja notEnoughGums ; Jump if input more than inventory
                                ; subtract item from inventory
                                sub gum, cl

                                ; Display success sell message
                                mov ah, 09
                                mov dx, offset doneGumSale ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp sellItemMenu

                sellCoffee:
                        ; Display prompt for how many waffles to sell
                        mov ah, 09h
                        mov dx, offset sellCoffeeMsg
                        int 21h

                        ; Wait and read user input
                        getAmountInput12:
                                mov ah, 01h
                                int 21h

                                ; Validation to check if amount is less than 1 or more than 91
                                ; convert the character in AL into the corresponding number 0-9
                                sub al, '0'
                                cmp al, 1
                                jl invalidAmountInput12
                                cmp al, 9
                                jg invalidAmountInput12
                                mov cl, al

                                ; Validation to check item amount
                                cmp cl, coffee ; check if enough waffle
                                ja notEnoughCoffees ; Jump if input more than inventory
                                ; subtract item from inventory
                                sub coffee, cl

                                ; Display success sell message
                                mov ah, 09
                                mov dx, offset doneCoffeeSale ; load offset of the string to be displayed
                                int 21h ; call interrupt to display string
                                ; Wait for user input for confirmation
                                mov ah, 01h
                                int 21h
                                jmp sellItemMenu

        ; return to main menu
        jmp returnToMenu

exitProgram:
; Exit program
        mov ah, 4ch
        int 21h

notEnoughWaffles:
; Display error message for not enough stock
        mov ah, 09h
        lea dx, noWaffleErr
        int 21h
        jmp sellItem ; prompt input again

notEnoughSodas:
; Display error message for not enough stock
        mov ah, 09h
        lea dx, noSodaErr
        int 21h
        jmp sellItem ; prompt input again

notEnoughBiscuits:
; Display error message for not enough stock
        mov ah, 09h
        lea dx, noBiscuitErr
        int 21h
        jmp sellItem ; prompt input again

notEnoughNoodles:
; Display error message for not enough stock
        mov ah, 09h
        lea dx, noNoodleErr
        int 21h
        jmp sellItem ; prompt input again

notEnoughGums:
; Display error message for not enough stock
        mov ah, 09h
        lea dx, noGumErr
        int 21h
        jmp sellItem ; prompt input again

notEnoughCoffees:
; Display error message for not enough stock
        mov ah, 09h
        lea dx, noCoffeeErr
        int 21h
        jmp sellItem ; prompt input again

invalidInput:
; Display error message for invalid input
        mov ah, 09h
        lea dx, menuErr
        int 21h
        jmp getMenuInput ; prompt input again

invalidOrderOptInput:
; Display error message for invalid input for order menu option
        mov ah, 09h
        lea dx, orderErr
        int 21h
        jmp getOrderOptInput ; prompt input again

invalidOrderNumInput:
; Display error message for invalid item number for order input
        mov ah, 09h
        lea dx, orderItemErr
        int 21h
        jmp getItemNumber ; prompt input again

invalidSellOptInput:
; Display error message for invalid input for sell menu option
        mov ah, 09h
        lea dx, orderErr
        int 21h
        jmp getSellOptInput ; prompt input again

invalidSellNumInput:
; Display error message for invalid item number for sell input
        mov ah, 09h
        lea dx, orderItemErr
        int 21h
        jmp getItemNumber1 ; prompt input again


invalidAmountInput1:
; Display error message for invalid amount for waffle input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput1 ; prompt input again

invalidAmountInput2:
; Display error message for invalid amount for soda input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput2 ; prompt input again

invalidAmountInput3:
; Display error message for invalid amount for biscuit input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput3 ; prompt input again

invalidAmountInput4:
; Display error message for invalid amount for noodle input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput4 ; prompt input again

invalidAmountInput5:
; Display error message for invalid amount for gum input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput5 ; prompt input again

invalidAmountInput6:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput6 ; prompt input again

invalidAmountInput7:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput7 ; prompt input again

invalidAmountInput8:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput8 ; prompt input again

invalidAmountInput9:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput9 ; prompt input again

invalidAmountInput10:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput10 ; prompt input again

invalidAmountInput11:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput11 ; prompt input again

invalidAmountInput12:
; Display error message for invalid amount for coffee input
        mov ah, 09h
        lea dx, amountOrderErr
        int 21h
        jmp getAmountInput12 ; prompt input again

listAllDisplay:
        save ; save registers onto stack
        mov ah, 09h ; set function code for displaying string
        int 21h ; call DOS interrupt to display string pointed by DS:DX
        mov dl, bh ; move high byte of BX into DL register
        mov ah, 02h ; set function code for displaying character
        int 21h ; call DOS interrupt to display character in DL register
        mov dl, bl ; move low byte of BX into DL register
        mov ah, 02h ; set function code for displaying character
        int 21h ; call DOS interrupt to display character in DL register
        restore ; restore registers from stack
        ret ; return from the function

returnToMenu:
; Return to main menu
        mov ah, 09h
        lea dx, CRLF
        int 21h
        lea dx, SPC
        int 21h
        mov ah, 09h ; display string function
        lea dx, pressAnyKeyMsg ; load offset of the string to be displayed
        int 21h ; call interrupt to display string

        ; Wait for user input
        mov ah, 01h
        int 21h
        jmp Main
Main endp

ClearScreen proc
        mov ah, 06h ;scroll up function
        mov al, 0   ;clear entire screen
        mov bh, 07h ;attribute (white on black)
        mov cx, 0   ;upper left corner row (0)
        mov dx, 184fh ;lower right corner row (24) and column (79)
        int 10h     ;call interrupt to clear screen
        ret
ClearScreen endp
end main