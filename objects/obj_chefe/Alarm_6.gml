if (estado!= "fragilizado") && (estado!= "morto") 
{
	instance_create_depth(0,0,-16000,obj_brilho);
	estado = "parado";
}