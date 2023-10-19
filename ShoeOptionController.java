package com.javastack.spring.sneakabyte.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.javastack.spring.sneakabyte.models.ShoeOptions;
import com.javastack.spring.sneakabyte.services.ShoeService;
import com.javastack.spring.sneakabyte.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ShoeOptionsController {
	@Autowired
	private UserService userServ;
	@Autowired
	private ShoeService shoeoptionsServ;

	// HOMEPAGE
	@GetMapping("/homepage") // Landing page after register login
	public String dashboard(HttpSession session, Model viewModel) {
		// if nothing in session it would send directly to the main page /
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userID = (Long) session.getAttribute("userId");
		// send a message to the service to grab the user on the saved ID in session, then save in in the model
		viewModel.addAttribute("loggedUser", userServ.findById(userID));
		viewModel.addAttribute("shoeOptions", shoeoptionsServ.getAllShoeOptions());
		return "homepage.jsp";
	}
	
	@GetMapping("/itemlisting") // Landing page after register login
	public String itemListingPage(HttpSession session, Model viewModel,
			// this model Attribute is needed so it would render to the form
			@ModelAttribute("newShoeListing") ShoeOptions newShoeOptions) {
		// if nothing in session it would send directly to the main page /
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userID = (Long) session.getAttribute("userId");
		// send a message to the service to grab the user on the saved ID in session, then save in in the model
		viewModel.addAttribute("loggedUser", userServ.findById(userID));
		return "shoelisting.jsp";
	}
	
	//This happens when user filled up the form, and add it to the db
	@PostMapping("/itemlisting")
	public String addShoeOptionToDB(@Valid @ModelAttribute("newShoeListing") ShoeOptions newShoeOptions, 
			BindingResult result, HttpSession session, Model viewModel) {

		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			// if the user ID of this user is incorrect, it would directly send them to the webpage
		}
		Long userID = (Long) session.getAttribute("userId");
		if(result.hasErrors()) {
			viewModel.addAttribute("loggedUser", userServ.findById(userID));
			return "shoelisting.jsp";
			// if the logged user made an error when submitting, send it back to the same page.
		} else {
			// else
			ShoeOptions updatedShoeOption = shoeoptionsServ.createShoe(newShoeOptions);
			return "redirect:/itemlisting/account/" + updatedShoeOption.getId();
			// take it to the GetMapping itemlisting/account/(and the id of the user)
		}
		// After filling up the form, this would go straight to viewforsaleshoes.jsp
		
	}

	// this is a mapping for selling a shoe
	@GetMapping("/itemlisting/account/{id}")
	public String shoeListing(@PathVariable Long id, HttpSession session, Model viewModel) {
		// when user is not active or on DB, it would redirect to the webpage.
		if(session.getAttribute("userId") == null ) {
			return "redirect:/";
		}
		
		Long userID = (Long) session.getAttribute("userId");
		// send a message to the service to grab the user on the saved ID in session, then save in in the model
		viewModel.addAttribute("loggedUser", userServ.findById(userID));
		
		// Get the ShoeOptions by the ID on ShoeService
		viewModel.addAttribute("thisShoe", shoeoptionsServ.getByIdShoeCreator(id));
		return "viewforsaleshoes.jsp";
		// thisShoe, is used in order to call the identity
		
	}
	
	// EDITING MAPPING
	@GetMapping("/itemlisting/edit/{id}")
	public String editShoeListing(@PathVariable Long id, HttpSession session, Model viewModel,
			// this model Attribute is needed so it would render to the form
			@ModelAttribute("thisShoeListing") ShoeOptions thisShoeListing) {
		// So only the user is able to log in
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userID = (Long) session.getAttribute("userId");
		// send a message to the service to grab the user on the saved ID in session, then save in in the model
		viewModel.addAttribute("loggedUser", userServ.findById(userID));
				
		// Grab this Shoe by ID
		viewModel.addAttribute("thisShoe", shoeoptionsServ.getByIdShoeCreator(id));
		return "editlisting.jsp";
	}
	
	// needed when EDITING the FORM
	@PutMapping("/itemlisting/editDB/{id}")
	public String editShoeListingDB(@Valid @ModelAttribute("thisShoeListing") ShoeOptions thisShoeListing,
			Model viewModel, @PathVariable Long id,
			BindingResult result, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		// if there is error, take it back to the edit plan, else redirect checkoutplan
		if (result.hasErrors()) {
			viewModel.addAttribute("thisShoeListing", shoeoptionsServ.getByIdShoeCreator(id).getName());
			return "editlisting.jsp";
		} else {
			ShoeOptions updatedShoeOption = shoeoptionsServ.createShoe(thisShoeListing);
			return "redirect:/itemlisting/account/" + updatedShoeOption.getId();
		}
// I'm stuck with this
	}
	
	// DELETE METHOD
	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		shoeoptionsServ.deleteShoeOptions(id);
			return "redirect:/homepage";
					
	}
	
	
}
