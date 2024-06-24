const UserModel = require("../model/user.model");
const UserService = require("../services/user.services");

exports.register = async(req,res,next)=>{
    try{
        const {mobile_number,name,faculty,address,password} = req.body;

        if (!mobile_number || !name || !faculty || !address || !password) {
            return res.status(400).send({ error: 'All fields are required' });
        }

        const successRes = await UserService.register(mobile_number,name,faculty,address,password);

        res.json({status:true, success:"User Registered Successfully"});
        
    }catch(error){
        if(error.message === "Mobile Number Already in use"){
            res.status(400).json({status: false, error: error.message});
        }else{
            throw(error);
        }
    }
}