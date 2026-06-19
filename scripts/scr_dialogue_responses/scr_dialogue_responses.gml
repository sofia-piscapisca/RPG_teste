function dialogue_responses() {
    switch (argument0) {
        case 0: 
            break;
        
        case 1: new_textbox("You gave response A!", 1);
            break;
        
        case 2: new_textbox("You gave response B! Any further response?", 1, ["3: Yes!", "0: No."]);
            break;
        
        case 3: new_textbox("Thanks for your responses!", 0);
            break;
        
        default: 
            break;
    	
    }
    
}