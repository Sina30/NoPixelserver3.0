window.addEventListener("message", receivedNuiMessage);

let v = new Vue({
	el: '#app',
	data: {
	  chars: {},
	  spawns: {},
	  spawnsClose: {},
	  currentCharData: null,
	  displayCharSelect: false,
	  showNewChar: false,
	  showDeleteConfirmation: null,
	  prevent: false,
	  timer: 0,
	  trackingX: 0,
	  trackingY: 0,
	  inState: false,
	  showHelp: false,
	  running: false,
	  currentSpawnShowing: -1,
	  currentSpawnSelected: -1,
	  currentSpawnHovering: -1,
	  currentSpawnX: 0.0,
	  currentSpawnY: 0.0,
	  currentSpawnFav: "",
	  counter:0,
	  canShow: false,
	  longName: false,
	  fadeHover: false,
	  refreshClicked: false,
	},
	methods: {
		onSubmit(event) {
			const formData = new FormData(event.target);
			const characterData = {};
			for (const item of formData.entries()) {
				characterData[item[0]] = item[1];
			}
			sendNuiMessage({
				action: "newCharacter",
				actionData: characterData
			})
			this.showNewChar = false;
		},
		deleteCharacter(id) {
			sendNuiMessage({
				action: "deleteCharacter",
				actionData: id
			})
			this.showDeleteConfirmation = null;
		},
		hoverCharacter(id) {
			sendNuiMessage({
				action: "hoverCharacter",
				actionData: id
			})
		},
		showHelpF(){
			this.showHelp = !this.showHelp
		},

		refreshCharacters() {
			if (!this.refreshClicked) {
				sendNuiMessage({
					action: "refreshCharacters"
				})
	
				this.refreshClicked = true
	
				setTimeout(() => {
					this.refreshClicked = false
				}, 5000)
			}
		},

		findRelative(e,isSingle){
			var relativeX = (e.pageX - $(e.target).offset().left),
            relativeY = (e.pageY - $(e.target).offset().top);

		    relativeX = this.normilize(relativeX,document.body.scrollWidth)
		    relativeY = this.normilize(relativeY,document.body.scrollHeight)
		    var safeToChange = true

		    if ($('#charbox').length){
			    if ($('#charbox').is(':hover')) {
				   safeToChange = false	
			    }
			}

			if (!this.showNewChar){
			    if ($('#helpButton').is(':hover') || $('#newcharButton').is(':hover')) {
				   safeToChange = false	
			    }
			}

			if (this.showHelp && !this.showNewChar){
			    if ($('#helpScreen').is(':hover')) {
				   safeToChange = false	
			    }
			}

			if(this.showDeleteConfirmation != null){
				safeToChange = false
			}

			if(isSingle){
		    	sendNuiMessage({
		    		action: "singleClick",
		    		x: relativeX,
		    		y: relativeY,
		    		safe: safeToChange
		    	})
		    }else{
		    	sendNuiMessage({
		    		action: "doubleClick",
		    		x: relativeX,
		    		y: relativeY,
		    		safe: safeToChange
		    	})
		    }

		},

		singleClick(e) {
			if (this.running){
				this.timer = setTimeout(function() {
			      if (!v.prevent) {
			        v.findRelative(e,true);
			      }
			      v.prevent = false;
			    }, 200);  
			}

			if (this.spawns.length != null && !$('#hoverSelect').is(':hover')) {
				if(this.currentSpawnSelected != -1 && this.currentSpawnHovering == -1){
					this.currentSpawnSelected = -1
					this.mouseleaveSpawn(-1)           
	                this.spawnUpdateCurrentSelection()
				}
			}
		},

		doubleClick(e){
			if (this.running){
				clearTimeout(this.timer);
			    this.prevent = true;
			    this.findRelative(e,false);
			}
		},

		hoveringChar(){
			sendNuiMessage({
	    		action: "currentHover",
	    		x: this.trackingX,
	    		y: this.trackingY
	    	})
		},

		tracking(e){
			if (this.running){
				
				var relativeX = (e.pageX - $(e.target).offset().left),
	            relativeY = (e.pageY - $(e.target).offset().top);

			    this.trackingX = this.normilize(relativeX,document.body.scrollWidth)
			    this.trackingY = this.normilize(relativeY,document.body.scrollHeight)

			    if(!this.inState){
			    	this.inState = true
			    	this.hoveringChar();
			    	this.timer = setTimeout(function() {
			    		v.inState = false
			    	}, 100);  
			    }
			}

			if(this.spawns.length != null){
				this.currentSpawnX =  e.clientY+$('.spawn-hover-select').height()/4
				this.currentSpawnY = e.clientX+$('.spawn-hover-select').width()/8

				if(this.currentSpawnShowing != -1 && this.currentSpawnSelected == -1){
					this.updateSpawnPosition()
				}
			}

			
		},

		normilize(val,max) { 
			var NewValue = (((val - 0) * (1 - 0)) / (max - 0)) + 0
			return NewValue;
		},

		onDiv(val) { 
			this.isOnDiv = val
		},

		spawn() { 
			this.inState = false;
			this.showHelp = false;
			sendNuiMessage({
				action: "selectCharacter",
				actionData: this.currentCharData.id
			})
		},

		deleteChar() { 
			this.showDeleteConfirmation = this.currentCharData
		},

		confirmDelete(){
			this.showDeleteConfirmation = null
			this.inState = false
			sendNuiMessage({
				action: "deleteCharacter",
				actionData: this.currentCharData.id
			})
		},

		exitCharSelect(){
			this.inState = false
			this.showNewChar = false
		},

		keypress(e){
			if (this.running){
				if (e.keyCode == 72 && !this.showNewChar){
					this.showHelp = !this.showHelp
				}
			}
		},
		
		selectSpawn(spawnInfo){

			if (spawnInfo != null && spawnInfo != '' && spawnInfo != false){
				this.inState = false
				this.defaultAll()
				sendNuiMessage({
					action: "spawnLocation",
					actionData: spawnInfo
				})
			}
		},

		getCorrectXY(origX,origY)
		{
			var maxRangeY = 4740 // do not change these 
			var maxRangeX = 3780 // do not change these


		

			var childPos = $( "#zeropoint" ).offset();
			var parentPos = $( "#zeropoint" ).parent().offset();
			var childOffset = {
			    top: childPos.top - parentPos.top,
			    left: childPos.left - parentPos.left
			}

			var leftInToZero = childOffset.left
			var topInToZero = childOffset.top


			var maxNewRangeY = document.getElementById("spawnBox").clientWidth - leftInToZero
			var maxNewRangeX = document.getElementById("spawnBox").clientHeight - topInToZero

			var scaledOx = topInToZero -  this.scaleBetween(origX, 0, maxNewRangeX, 0.0, maxRangeX)
			var scaledOy =  leftInToZero - this.scaleBetween(origY, 0, maxNewRangeY, 0.0, maxRangeY)

			return [scaledOx,scaledOy]
		},

		scaleBetween(unscaledNum, minAllowed, maxAllowed, min, max) {
		  return (maxAllowed - minAllowed) * (unscaledNum - min) / (max - min) + minAllowed;
		},

		isNearPoint(currentTable,position){
			var dSpawn = currentTable[position]
			var dist = 20
			var nearList = [];
			
			for (var i = currentTable.length - 1; i >= 0; i--) {
				var isNear = false
				if (i != position){
					if ((dSpawn.posX >= currentTable[i].posX-dist && dSpawn.posX <= currentTable[i].posX + dist) && (dSpawn.posY >= currentTable[i].posY-dist && dSpawn.posY <= currentTable[i].posY + dist)){
						isNear = true
					}
				}

				if (isNear){
					nearList.push(i);
				}
			}

			return nearList
			
		},

		obtainParent(currentTable,position)
		{
			var returnParent = position
			for (var j = this.spawnsClose[position].length - 1; j >= 0; j--) {
				var pos = this.spawnsClose[position][j]
				var closestTable = currentTable[pos]
				if(closestTable.parent != null){
					returnParent = closestTable.parent
				}
			}

			return returnParent
		},

		mouseoverSpawn(spawnID){
			if(this.currentSpawnShowing == -1){
				this.currentSpawnShowing = spawnID
				$('.spawn-hover-select').css("display", "flex");
			}
			this.currentSpawnHovering = spawnID
		},

		mouseleaveSpawn(spawnID){

			if (this.currentSpawnSelected == -1){
				this.currentSpawnShowing = -1
				$('.spawn-hover-select').css("display", "none");
			}
			this.currentSpawnHovering = -1

		},

		spawnClickInput(spawnInfo,spawnID) {

			//Spawn in if # of spawns == 1
			if(this.spawnsClose[spawnID].length != 0){
				//Open menu
				this.currentSpawnSelected = spawnID              
                this.spawnUpdateCurrentSelection()
			}else {
				//Spawn in
				if (spawnInfo != null && spawnInfo != '' && spawnInfo != false){
					this.inState = false
					this.defaultAll()
					sendNuiMessage({
						action: "spawnLocation",
						actionData: spawnInfo
					})
				}
			}
			
			
			/*var self = this
            this.counter++ 
            if(this.counter == 1) {
            	this.currentSpawnSelected = spawnID
            	this.currentSpawnShowing =  spawnID
            	this.spawnUpdateCurrentSelection()
            	this.updateSpawnPosition()
                this.timer = setTimeout(function() {
                	self.counter = 0
                    self.currentSpawnSelected = spawnID              
                    self.spawnUpdateCurrentSelection()
                }, 200); 
            }else{
                clearTimeout(this.timer);
                self.counter = 0;

                if(this.spawnsClose[spawnID].length == 0){
                	this.currentSpawnSelected = -1
                	$('.spawn-hover-select').removeClass("spawn-active");
	    			$('.module__contents').css("background-color", "rgba(46, 46, 46,0.50)"); 
                	this.selectSpawn(spawnInfo)
                }else{
                	this.currentSpawnSelected = spawnID              
                    this.spawnUpdateCurrentSelection()
                }
            }*/
	    },

	    spawnUpdateCurrentSelection(){
	    	if(this.currentSpawnSelected != -1){
	    		$('.spawn-hover-select').addClass("spawn-active");   
	    		$('.module__contents').css("background-color", "#222831");
	    	}else{
	    		$('.spawn-hover-select').removeClass("spawn-active");
	    		$('.module__contents').css("background-color", "#222831");  
	    	}
	    },

	    updateSpawnPosition(){
	    	$('.spawn-hover-select').css({
				"top":  this.currentSpawnX - 20, 
				"left": this.currentSpawnY
			})
	    },

	    rightClickSpawn(spawnID,isPoint){
	    	

	    	if(isPoint){
	    		if(this.spawnsClose[spawnID].length == 0){
	    			this.sendFav(spawnID)
	    		}
	    	}
	    	else
	    	{
		    	this.sendFav(spawnID)
		    }
	    },

	    sendFav(spawnID)
	    {
	    	this.currentSpawnFav = this.spawns[spawnID].info
	    	sendNuiMessage({
				action: "favorite",
				actionData: this.currentSpawnFav
			})
	    },

	    defaultAll()
	    {
			this.currentCharData = null
			this.displayCharSelect = false
			this.showNewChar = false
			this.showDeleteConfirmation = null
			this.prevent = false
			this.timer = 0
			this.trackingX = 0
			this.trackingY = 0
			this.inState = false
			this.showHelp = false
			this.running = false
			this.currentSpawnShowing = -1
			this.currentSpawnSelected = -1
			this.currentSpawnHovering = -1
			this.currentSpawnX = 0.0
			this.currentSpawnY = 0.0
			this.currentSpawnFav = ""
			this.counter =0
			this.longName = false
			this.fadeHover = false

			$('.spawn-hover-select').removeClass("spawn-active");
			$('.spawn-hover-select').css("display", "none");
	    	$('.module__contents').css("background-color", "rgba(46, 46, 46,0.50)"); 

	    	this.canShow = false
	    	this.chars = {}
		    this.spawns = {}
		    this.spawnsClose = {}
	    },

	    resize(){
	    	if(this.spawns.length != null){

				for (var i = this.spawns.length - 1; i >= 0; i--) {
					var xyReturn = v.getCorrectXY(this.spawns[i].posXD,this.spawns[i].posXY)

					this.spawns[i].posX = xyReturn[0]
					this.spawns[i].posY = xyReturn[1]
				}
			}
	    }
	},

	created: function () {
		document.addEventListener('mousemove', this.tracking);
		document.addEventListener('keydown', this.keypress);
		document.addEventListener('dblclick', this.doubleClick);
		document.addEventListener('mousedown', this.singleClick);
		window.addEventListener("resize", this.resize);
		document.addEventListener('contextmenu', function(e) {
		  e.preventDefault();
		});
	}
})

Vue.config.devtools = true;

Vue.filter('formatDate', function(value) {
	if (value) {
	  const formatDate = new Date(value)
	  return moment.utc(value+86400000).format("YYYY-MM-DD")
	  //return `${formatDate.getUTCMonth()}/${formatDate.getUTCDay()}/${formatDate.getUTCFullYear()}`
	}
});

function receivedNuiMessage(event) {
	var data = event.data;

	if (data.update){
		if (data.currentSelect != null){
			var position = data.currentSelect.position

			//Hover on/off
			if((data.currentSelect.position - 1) != v.$data.chars.indexOf(v.$data.currentCharData) || data.forceHover){
				v.$data.fadeHover = data.fadeHover;
			}
				
			v.$data.currentCharData = v.$data.chars[position-1]
			if (v.$data.currentCharData != null){
				v.$data.currentCharData.isInJail = isInJail(v.$data.currentCharData);

				//Check if name length > 20 chars
				v.$data.longName = (v.$data.currentCharData.first_name.length + v.$data.currentCharData.last_name.length > 20);
			}
		}else{
			v.$data.currentCharData = null
		}
			
	}

	if (data.open){
		document.getElementById("mainBox").style.display = "flex";
		v.$data.displayCharSelect = true
		v.$data.chars = data.chars;
		v.$data.running = true
	}

	if (data.close){
		document.getElementById("mainBox").style.display = "none";
		v.$data.chars = null
		v.$data.currentCharData = null
		v.$data.displayCharSelect = false
		v.$data.running = false
	}

	if (data.default){
		v. defaultAll()
	}


	if (data.newChar){
		v.$data.showNewChar = true
	}

	if (data.firstOpen) {
		v.$data.showNewChar = true;
		v.$data.showHelp = true;
	}

	if(data.startAnim){
		document.getElementById("animTran1").classList.add("Transistion-anim");
		document.getElementById("animTran2").classList.add("Transistion-anim");
	}

	if(data.showAnim){
		document.getElementById("tranCon").style.display = "block"
	}

	if(data.showSpawnMenu){
		v.$data.canShow = true
	}

	if (data.updateSpawnMenu){
		
		var spawns = data.spawns
		for (var i = spawns.length - 1; i >= 0; i--) {
			var xyReturn = v.getCorrectXY(spawns[i].posX,spawns[i].posY)

			spawns[i].posXD = spawns[i].posX
			spawns[i].posXY = spawns[i].posY
			spawns[i].posX = xyReturn[0]
			spawns[i].posY = xyReturn[1]
			spawns[i].id = i
		}

		// must wait till a full conversion of XY to take place before moving onto checking if near
		// that is why there is so many for loops :/ 

		for (var i = spawns.length - 1; i >= 0; i--) {
			var isNear = v.isNearPoint(spawns,i)
			v.$data.spawnsClose[i] = isNear
		}

		// same again with building the checks for if is close and seperating them into groups 

		for (var i = 0; i <= spawns.length - 1; i++) {
			
			if(v.$data.spawnsClose[i].length >= 1 ){
				var parent = v.obtainParent(spawns,i)
				spawns[i].parent = parent
				spawns[i].stacked = true;
			}
			else{
				spawns[i].parent = i
			}

		}

		v.$data.currentSpawnFav = data.fav
		v.$data.spawns = spawns
	}

}

function isInJail(char){
	var isInJail = false

	if (char != null){
		if(char.RealJailTime >= 0)
			isInJail = true

		if(char.jail_time_mobster != 0)
			isInJail = true

		if(char.jail_life != 0)
			isInJail = true

		if(char.rehab != 0)
			isInJail = true
	}

	return isInJail
}


function sendNuiMessage(data){
	$.post("https://ab-spawn/nuiCallback", JSON.stringify(data));
}


function disableTransistion() {	
	document.getElementById("tranCon").style.display = "none"
	document.getElementById("animTran1").classList.remove("Transistion-anim");
	document.getElementById("animTran2").classList.remove("Transistion-anim");
	sendNuiMessage({
		action: "proceed",
	})
}

var el = document.getElementById("animTran1");
el.addEventListener("webkitAnimationEnd", disableTransistion, false);
el.addEventListener("oAnimationEnd"     , disableTransistion, false);
el.addEventListener("msAnimationEnd"    , disableTransistion, false);
el.addEventListener("animationend"      , disableTransistion, false);
