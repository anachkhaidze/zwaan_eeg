<?xml version="1.0" ?>
<PsychoPy2experiment encoding="utf-8" version="2022.2.5">
  <Settings>
    <Param val="use prefs" valType="str" updates="None" name="Audio latency priority"/>
    <Param val="use prefs" valType="str" updates="None" name="Audio lib"/>
    <Param val="" valType="str" updates="None" name="Completed URL"/>
    <Param val="auto" valType="str" updates="None" name="Data file delimiter"/>
    <Param val="u'data/%s_%s_%s' % (expInfo['participant'], expName, expInfo['date'])" valType="code" updates="None" name="Data filename"/>
    <Param val="True" valType="bool" updates="None" name="Enable Escape"/>
    <Param val="{'participant':'f&quot;{randint(0, 999999):06.0f}&quot;', 'session':'001'}" valType="code" updates="None" name="Experiment info"/>
    <Param val="True" valType="bool" updates="None" name="Force stereo"/>
    <Param val="True" valType="bool" updates="None" name="Full-screen window"/>
    <Param val="" valType="str" updates="None" name="HTML path"/>
    <Param val="" valType="str" updates="None" name="Incomplete URL"/>
    <Param val="testMonitor" valType="str" updates="None" name="Monitor"/>
    <Param val="[]" valType="list" updates="None" name="Resources"/>
    <Param val="False" valType="bool" updates="None" name="Save csv file"/>
    <Param val="False" valType="bool" updates="None" name="Save excel file"/>
    <Param val="False" valType="bool" updates="None" name="Save hdf5 file"/>
    <Param val="True" valType="bool" updates="None" name="Save log file"/>
    <Param val="True" valType="bool" updates="None" name="Save psydat file"/>
    <Param val="True" valType="bool" updates="None" name="Save wide csv file"/>
    <Param val="1" valType="num" updates="None" name="Screen"/>
    <Param val="True" valType="bool" updates="None" name="Show info dlg"/>
    <Param val="False" valType="bool" updates="None" name="Show mouse"/>
    <Param val="height" valType="str" updates="None" name="Units"/>
    <Param val="" valType="str" updates="None" name="Use version"/>
    <Param val="(1024, 768)" valType="list" updates="None" name="Window size (pixels)"/>
    <Param val="avg" valType="str" updates="None" name="blendMode"/>
    <Param val="$[0,0,0]" valType="color" updates="None" name="color"/>
    <Param val="rgb" valType="str" updates="None" name="colorSpace"/>
    <Param val="100.1.1.1" valType="str" updates="None" name="elAddress"/>
    <Param val="FILTER_LEVEL_2" valType="str" updates="None" name="elDataFiltering"/>
    <Param val="FILTER_LEVEL_OFF" valType="str" updates="None" name="elLiveFiltering"/>
    <Param val="EYELINK 1000 DESKTOP" valType="str" updates="None" name="elModel"/>
    <Param val="ELLIPSE_FIT" valType="str" updates="None" name="elPupilAlgorithm"/>
    <Param val="PUPIL_AREA" valType="str" updates="None" name="elPupilMeasure"/>
    <Param val="1000" valType="num" updates="None" name="elSampleRate"/>
    <Param val="False" valType="bool" updates="None" name="elSimMode"/>
    <Param val="RIGHT_EYE" valType="str" updates="None" name="elTrackEyes"/>
    <Param val="PUPIL_CR_TRACKING" valType="str" updates="None" name="elTrackingMode"/>
    <Param val="anaExpRush" valType="str" updates="None" name="expName"/>
    <Param val="on Sync" valType="str" updates="None" name="exportHTML"/>
    <Param val="None" valType="str" updates="None" name="eyetracker"/>
    <Param val="127.0.0.1" valType="str" updates="None" name="gpAddress"/>
    <Param val="4242" valType="num" updates="None" name="gpPort"/>
    <Param val="ioHub" valType="str" updates="None" name="keyboardBackend"/>
    <Param val="exp" valType="code" updates="None" name="logging level"/>
    <Param val="MIDDLE_BUTTON" valType="list" updates="None" name="mgBlink"/>
    <Param val="CONTINUOUS" valType="str" updates="None" name="mgMove"/>
    <Param val="0.5" valType="num" updates="None" name="mgSaccade"/>
    <Param val="0.6" valType="num" updates="None" name="plConfidenceThreshold"/>
    <Param val="True" valType="bool" updates="None" name="plPupilCaptureRecordingEnabled"/>
    <Param val="" valType="str" updates="None" name="plPupilCaptureRecordingLocation"/>
    <Param val="127.0.0.1" valType="str" updates="None" name="plPupilRemoteAddress"/>
    <Param val="50020" valType="num" updates="None" name="plPupilRemotePort"/>
    <Param val="1000" valType="num" updates="None" name="plPupilRemoteTimeoutMs"/>
    <Param val="False" valType="bool" updates="None" name="plPupillometryOnly"/>
    <Param val="psychopy_iohub_surface" valType="str" updates="None" name="plSurfaceName"/>
    <Param val="" valType="str" updates="None" name="tbLicenseFile"/>
    <Param val="" valType="str" updates="None" name="tbModel"/>
    <Param val="60" valType="num" updates="None" name="tbSampleRate"/>
    <Param val="" valType="str" updates="None" name="tbSerialNo"/>
  </Settings>
  <Routines>
    <Routine name="trial">
      <CodeComponent name="code">
        <Param val="" valType="extendedCode" updates="constant" name="Before Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Before JS Experiment"/>
        <Param val="textL = ['There was corn in the field', 'bear in danger' ]&amp;#10;imageL = ['path1', 'path2'] &amp;#10;aorb = ['a','b']&amp;#10;ind = np.arange(len(textL))&amp;#10;" valType="extendedCode" updates="constant" name="Begin Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin JS Routine"/>
        <Param val="random.shuffle(ind)&amp;#10;trl_cnt = 0&amp;#10;&amp;#10;" valType="extendedCode" updates="constant" name="Begin Routine"/>
        <Param val="Py" valType="str" updates="None" name="Code Type"/>
        <Param val="" valType="extendedCode" updates="constant" name="Each Frame"/>
        <Param val="" valType="extendedCode" updates="constant" name="Each JS Frame"/>
        <Param val="" valType="extendedCode" updates="constant" name="End Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="End JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="End JS Routine"/>
        <Param val="" valType="extendedCode" updates="constant" name="End Routine"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="code" valType="code" updates="None" name="name"/>
      </CodeComponent>
    </Routine>
    <Routine name="fixation">
      <PolygonComponent name="polygon">
        <Param val="center" valType="str" updates="constant" name="anchor"/>
        <Param val="rgb" valType="str" updates="constant" name="colorSpace"/>
        <Param val="1" valType="num" updates="constant" name="contrast"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="" valType="code" updates="None" name="durationEstim"/>
        <Param val="white" valType="color" updates="constant" name="fillColor"/>
        <Param val="linear" valType="str" updates="constant" name="interpolate"/>
        <Param val="white" valType="color" updates="constant" name="lineColor"/>
        <Param val="1" valType="num" updates="constant" name="lineWidth"/>
        <Param val="4" valType="int" updates="constant" name="nVertices"/>
        <Param val="polygon" valType="code" updates="None" name="name"/>
        <Param val="" valType="num" updates="constant" name="opacity"/>
        <Param val="0" valType="num" updates="constant" name="ori"/>
        <Param val="(0, 0)" valType="list" updates="constant" name="pos"/>
        <Param val="True" valType="bool" updates="None" name="saveStartStop"/>
        <Param val="cross" valType="str" updates="None" name="shape"/>
        <Param val="(0.5, 0.5)" valType="list" updates="constant" name="size"/>
        <Param val="" valType="code" updates="None" name="startEstim"/>
        <Param val="time (s)" valType="str" updates="None" name="startType"/>
        <Param val="0.0" valType="code" updates="None" name="startVal"/>
        <Param val="duration (s)" valType="str" updates="None" name="stopType"/>
        <Param val="1.0" valType="code" updates="constant" name="stopVal"/>
        <Param val="True" valType="bool" updates="None" name="syncScreenRefresh"/>
        <Param val="from exp settings" valType="str" updates="None" name="units"/>
        <Param val="" valType="list" updates="constant" name="vertices"/>
      </PolygonComponent>
    </Routine>
    <Routine name="text_display">
      <CodeComponent name="code_2">
        <Param val="" valType="extendedCode" updates="constant" name="Before Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Before JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin JS Routine"/>
        <Param val="#setting parameters&amp;#10;conditionThisTrl = conditionThisPerson.iloc[trl_cnt,:] #the row of df&amp;#10;displayStr =  conditionThisTrl.cue.values#testL is one string of sentence&amp;#10;displayList = displayStr.split() #spliting the sentence into list of words&amp;#10;elapse = 0.2 #the time inbetween each word display&amp;#10;display_word = 0.2 #the time for each word to be presented&amp;#10;word_cnt = 0 #this is a counter for looping through the words&amp;#10;&amp;#10;#the total time for sentence display in this trial&amp;#10;trial_t = len(displayList) * display_word  + len(displayList)*elapse &amp;#10;#initialize the first word of the sentence to be displayed&amp;#10;#display_now is updated in each frame&amp;#10;display_now = displayList[word_cnt] &amp;#10;timer = core.Clock() #initiate timer&amp;#10;&amp;#10;#to save data&amp;#10;&quot;&quot;&quot;..wip&quot;&quot;&quot;&amp;#10;dataArr = dict(zip(conditionThisTrl.index,conditionThisTrl.values))&amp;#10;[thisExp.addData(list(dataArr.keys())[i],&amp;#10;                dataArr[list(dataArr.keys())[i]]) for i in range(len(dataArr))]" valType="extendedCode" updates="constant" name="Begin Routine"/>
        <Param val="Py" valType="str" updates="None" name="Code Type"/>
        <Param val="tnow = timer.getTime() #in each frame we evaluate the time&amp;#10;#if the time exteed the total time for each word, loop to the next word&amp;#10;if tnow &gt; display_word + elapse:&amp;#10;    word_cnt +=1&amp;#10;    display_now = displayList[word_cnt]&amp;#10;    timer = core.Clock()&amp;#10;    if word_cnt == len(displayList) -1:&amp;#10;        continue&amp;#10;#else if we exceed the time limit for each word, we clear the current&amp;#10;#word display to be empty i.e. elapse between word&amp;#10;elif (tnow &gt; display_word) &amp; (tnow &lt; display_word + elapse):&amp;#10;     display_now = ' '&amp;#10;        &amp;#10;" valType="extendedCode" updates="constant" name="Each Frame"/>
        <Param val="" valType="extendedCode" updates="constant" name="Each JS Frame"/>
        <Param val="" valType="extendedCode" updates="constant" name="End Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="End JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="End JS Routine"/>
        <Param val="trl_cnt +=1&amp;#10;word_cnt = 0&amp;#10;display_now = ' '" valType="extendedCode" updates="constant" name="End Routine"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="code_2" valType="code" updates="None" name="name"/>
      </CodeComponent>
      <TextComponent name="text">
        <Param val="white" valType="color" updates="constant" name="color"/>
        <Param val="rgb" valType="str" updates="constant" name="colorSpace"/>
        <Param val="1" valType="num" updates="constant" name="contrast"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="" valType="code" updates="None" name="durationEstim"/>
        <Param val="None" valType="str" updates="constant" name="flip"/>
        <Param val="Open Sans" valType="str" updates="constant" name="font"/>
        <Param val="LTR" valType="str" updates="None" name="languageStyle"/>
        <Param val="0.05" valType="num" updates="constant" name="letterHeight"/>
        <Param val="text" valType="code" updates="None" name="name"/>
        <Param val="" valType="num" updates="constant" name="opacity"/>
        <Param val="0" valType="num" updates="constant" name="ori"/>
        <Param val="(0, 0)" valType="list" updates="constant" name="pos"/>
        <Param val="True" valType="bool" updates="None" name="saveStartStop"/>
        <Param val="" valType="code" updates="None" name="startEstim"/>
        <Param val="time (s)" valType="str" updates="None" name="startType"/>
        <Param val="0.0" valType="code" updates="None" name="startVal"/>
        <Param val="duration (s)" valType="str" updates="None" name="stopType"/>
        <Param val="$trial_t" valType="code" updates="constant" name="stopVal"/>
        <Param val="True" valType="bool" updates="None" name="syncScreenRefresh"/>
        <Param val="$display_now" valType="str" updates="set every frame" name="text"/>
        <Param val="from exp settings" valType="str" updates="None" name="units"/>
        <Param val="" valType="num" updates="constant" name="wrapWidth"/>
      </TextComponent>
      <ImageComponent name="image">
        <Param val="center" valType="str" updates="constant" name="anchor"/>
        <Param val="$[1,1,1]" valType="color" updates="constant" name="color"/>
        <Param val="rgb" valType="str" updates="constant" name="colorSpace"/>
        <Param val="1" valType="num" updates="constant" name="contrast"/>
        <Param val="True" valType="bool" updates="None" name="disabled"/>
        <Param val="" valType="code" updates="None" name="durationEstim"/>
        <Param val="False" valType="bool" updates="constant" name="flipHoriz"/>
        <Param val="False" valType="bool" updates="constant" name="flipVert"/>
        <Param val="" valType="file" updates="constant" name="image"/>
        <Param val="linear" valType="str" updates="constant" name="interpolate"/>
        <Param val="" valType="str" updates="constant" name="mask"/>
        <Param val="image" valType="code" updates="None" name="name"/>
        <Param val="" valType="num" updates="constant" name="opacity"/>
        <Param val="0" valType="num" updates="constant" name="ori"/>
        <Param val="(0, 0)" valType="list" updates="constant" name="pos"/>
        <Param val="True" valType="bool" updates="None" name="saveStartStop"/>
        <Param val="(0.5, 0.5)" valType="list" updates="constant" name="size"/>
        <Param val="" valType="code" updates="None" name="startEstim"/>
        <Param val="time (s)" valType="str" updates="None" name="startType"/>
        <Param val="0.0" valType="code" updates="None" name="startVal"/>
        <Param val="duration (s)" valType="str" updates="None" name="stopType"/>
        <Param val="1.0" valType="code" updates="constant" name="stopVal"/>
        <Param val="True" valType="bool" updates="None" name="syncScreenRefresh"/>
        <Param val="128" valType="num" updates="constant" name="texture resolution"/>
        <Param val="from exp settings" valType="str" updates="None" name="units"/>
      </ImageComponent>
    </Routine>
    <Routine name="exp_ctrl">
      <CodeComponent name="code_3">
        <Param val="import pandas as pd&amp;#10;import numpy as np&amp;#10;import random&amp;#10;import math" valType="extendedCode" updates="constant" name="Before Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Before JS Experiment"/>
        <Param val="textLMegaCond1 = [['There was a corn in the field.','There was apple pie on the table.',&amp;#10;                   'There was a towel on the floor.', 'There was an owl in the barn.',&amp;#10;                   'There was a tomato on the vine.', 'There was a book on the photocopier.',&amp;#10;                   'There was a lamp on the floor', 'There was a sailboat on the trailer',&amp;#10;                   'There was a squid in the water', 'There was a mushroom in the forest',&amp;#10;                   'There was ice in the glass', 'There was a shirt on the hanger',&amp;#10;                   'There was a staple in the machine.', 'There was a zodiac in the ocean.',&amp;#10;                   'There was an umbrella in her backpack.', 'There was a shoelace in the package.',&amp;#10;                   'There was a walnut on the tree.', 'There was cheesecake for the party.',&amp;#10;                   'There was a swiss knife in his pocket.', 'There was a lobster in the sea.',&amp;#10;                   'There was a lime in the produce section.', 'There was a hose on the wall.',&amp;#10;                   'There was a hockey player on the ice.', 'There was a scarf on the rack.',&amp;#10;                   'There was a pumpkin on the cart.', 'There was a garbage bag in the cupboard.',&amp;#10;                   'There was an eagle in the nest.', 'There was an avocado in the pantry.',&amp;#10;                   'There was paint in the store', 'There was a tissue in the box',&amp;#10;                   'There was a balloon in the air.', 'There was a match in the ashtray.',&amp;#10;                   'There was spaghetti in the bowl.', 'There was a coat on the floor.',&amp;#10;                   'There was fish in the oven.', 'There was an airplane in the sky.',&amp;#10;                   'There was tinfoil in the garbage.', 'There was carrot in the curry.',&amp;#10;                   'There was a banana on the counter.', 'There was a goose in the sky.',&amp;#10;                   'There was tape on the package.', 'There was cucumber in the salad.',&amp;#10;                   'There was bread in the toaster.', 'There was a cigarette in the ashtray.',&amp;#10;                   'There was sugar on the spoon.', 'There was a newspaper on the rack.',&amp;#10;                   'There was a horse in the arena.', 'There was ketchup on the plate.',&amp;#10;                   'There was apple in the salad.', 'There was pineapple on the skewer.',&amp;#10;                   'There was wool in the sweater.', 'There was a map on the wall.',&amp;#10;                   'There was onion in the batter.', 'There was wheat in the mill.',&amp;#10;                   'There was lemon in the drink.', 'There was soap in the bath.',&amp;#10;                   'There was chicken in the oven.', 'There was watermelon in the bowl.',&amp;#10;                   'There was an egg on the plate.', 'There was a frog in the pool.',&amp;#10;                   'There was a beach on the monkey.', 'There was a dresser on the tiger.',&amp;#10;                   'There was a trail on the trees.', 'There was a phone in the battery.',&amp;#10;                   'There was a bench in the doll.', 'There was a calculator in the candy.',&amp;#10;                   'There was a hill in the glove.', 'There was a porch on the tent.',&amp;#10;                   'There was a cave on the meadow.', 'There was a yard in the salsa.',&amp;#10;                   'There was a desk in the skateboard.', 'There was a cup in the pencil.',&amp;#10;                   'There was a school in the polar bear.', 'There was a farm in the purse.',&amp;#10;                   'There was a park in the statue.', 'There was a kayak in the mannequin.',&amp;#10;                   'There was a lipstick in the celery.', 'There was a fire in the tea.',&amp;#10;                   'There was a city in the pepper.', 'There was a bowl in the hammer.',&amp;#10;                   'There was a workshop in the leaf.', 'There was an ornament in the toothpick.',&amp;#10;                   'There were woods in the garlic.', 'There was a board in the thumbtack.',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',&amp;#10;                   '', '',],&amp;#10;                    ['p1',' p2'],&amp;#10;                    ['corn','apple pie', 'towel', 'owl', 'tomato', 'book',&amp;#10;                    'lamp', 'sailboat', 'squid', 'mushroom', 'ice', 'shirt',&amp;#10;                    'staple', 'zodiac', 'umbrella', 'shoelace', 'walnut',&amp;#10;                    'cheesecake', 'swiss knife', 'lobster', 'lime', 'hose',&amp;#10;                    'hockey', 'scarf', 'pumpkin', 'garbage', 'eagle', 'avocado',&amp;#10;                    'paint', 'tissue', 'balloon', 'match', 'spaghetti', 'coat',&amp;#10;                    'fish', 'airplane', 'foil', 'carrot', 'banana', 'goose',&amp;#10;                    'tape', 'cucumber', 'bread', 'cigarette', 'sugar', 'newspaper',&amp;#10;                    'horse', 'ketchup', 'apple', 'pineapple', 'wool', 'map',&amp;#10;                    'onion', 'wheat', 'lemon', 'soap', 'chicken', 'watermelon',&amp;#10;                    'egg', 'frog', 'beach', 'dresser', 'trail', 'phone',&amp;#10;                    'bench', 'calculator', 'hill', 'porch', 'cave', 'yard',&amp;#10;                    'deck', 'cup', 'school', 'farm', 'park', 'kayak',&amp;#10;                    'lipstick', 'fire', 'city', 'bowl', 'workshop', 'ornament',&amp;#10;                    'woods', 'board', 'surf board', 'outlet', 'bedroom', 'desert',&amp;#10;                    'stove', 'snake', 'street', 'sauce', 'toolbox', 'distance',&amp;#10;                    'roof', 'driveway', 'bicycle', 'pyramid', 'field', 'dress',&amp;#10;                    'highway', 'chimney', 'table', 'flower', 'deck', 'water bottle',&amp;#10;                    'zoon', 'bison', 'head', 'pool', 'raft', 'trash can',&amp;#10;                    'shelf', 'neck', 'counter', 'garden', 'seal', 'side table',&amp;#10;                    'hand', 'stage',]]&amp;#10;textLMegaCond2 = [['There was a corn in the field.','There was apple pie on the table.',&amp;#10;                   'There was a towel on the floor.', 'There was an owl in the barn.',&amp;#10;                   'There was a tomato on the vine.', 'There was a book on the photocopier.',&amp;#10;                   'There was a lamp on the floor', 'There was a sailboat on the trailer',&amp;#10;                   'There was a squid in the water', 'There was a mushroom in the forest',&amp;#10;                   'There was ice in the glass', 'There was a shirt on the hanger',&amp;#10;                   'There was a staple in the machine.', 'There was a zodiac in the ocean.',&amp;#10;                   'There was an umbrella in her backpack.', ],&amp;#10;                    ['p10',' p20'],&amp;#10;                    ['aaa','bbb']]&amp;#10;&amp;#10;&amp;#10;&amp;#10;megamega = [textLMegaCond1,textLMegaCond2]" valType="extendedCode" updates="constant" name="Begin Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="Begin JS Routine"/>
        <Param val="#randomly pick four conditions&amp;#10;personCond = random.randint(1,4) &amp;#10;path = 'trlInfo' + str(personCond) + '.csv'&amp;#10;#read in the corresponding condition file&amp;#10;#and shuffle the rows to be randomized for each subj&amp;#10;conditionThisPerson = pd.read_csv(path).sample(frac = 1)&amp;#10;&amp;#10;thisExp.addData('thisCond',path)" valType="extendedCode" updates="constant" name="Begin Routine"/>
        <Param val="Py" valType="str" updates="None" name="Code Type"/>
        <Param val="" valType="extendedCode" updates="constant" name="Each Frame"/>
        <Param val="" valType="extendedCode" updates="constant" name="Each JS Frame"/>
        <Param val="" valType="extendedCode" updates="constant" name="End Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="End JS Experiment"/>
        <Param val="" valType="extendedCode" updates="constant" name="End JS Routine"/>
        <Param val="" valType="extendedCode" updates="constant" name="End Routine"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="code_3" valType="code" updates="None" name="name"/>
      </CodeComponent>
    </Routine>
    <Routine name="makesense">
      <TextComponent name="text_2">
        <Param val="white" valType="color" updates="constant" name="color"/>
        <Param val="rgb" valType="str" updates="constant" name="colorSpace"/>
        <Param val="1" valType="num" updates="constant" name="contrast"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="" valType="code" updates="None" name="durationEstim"/>
        <Param val="None" valType="str" updates="constant" name="flip"/>
        <Param val="Open Sans" valType="str" updates="constant" name="font"/>
        <Param val="LTR" valType="str" updates="None" name="languageStyle"/>
        <Param val="0.05" valType="num" updates="constant" name="letterHeight"/>
        <Param val="text_2" valType="code" updates="None" name="name"/>
        <Param val="" valType="num" updates="constant" name="opacity"/>
        <Param val="0" valType="num" updates="constant" name="ori"/>
        <Param val="(0, 0)" valType="list" updates="constant" name="pos"/>
        <Param val="True" valType="bool" updates="None" name="saveStartStop"/>
        <Param val="" valType="code" updates="None" name="startEstim"/>
        <Param val="time (s)" valType="str" updates="None" name="startType"/>
        <Param val="0.5" valType="code" updates="None" name="startVal"/>
        <Param val="duration (s)" valType="str" updates="None" name="stopType"/>
        <Param val="" valType="code" updates="constant" name="stopVal"/>
        <Param val="True" valType="bool" updates="None" name="syncScreenRefresh"/>
        <Param val="does this make sense &amp;#10;y or n" valType="str" updates="constant" name="text"/>
        <Param val="from exp settings" valType="str" updates="None" name="units"/>
        <Param val="" valType="num" updates="constant" name="wrapWidth"/>
      </TextComponent>
      <KeyboardComponent name="key_resp">
        <Param val="'y','n'" valType="list" updates="constant" name="allowedKeys"/>
        <Param val="" valType="str" updates="constant" name="correctAns"/>
        <Param val="False" valType="bool" updates="None" name="disabled"/>
        <Param val="True" valType="bool" updates="constant" name="discard previous"/>
        <Param val="" valType="code" updates="None" name="durationEstim"/>
        <Param val="True" valType="bool" updates="constant" name="forceEndRoutine"/>
        <Param val="key_resp" valType="code" updates="None" name="name"/>
        <Param val="True" valType="bool" updates="None" name="saveStartStop"/>
        <Param val="" valType="code" updates="None" name="startEstim"/>
        <Param val="time (s)" valType="str" updates="None" name="startType"/>
        <Param val="0.0" valType="code" updates="None" name="startVal"/>
        <Param val="duration (s)" valType="str" updates="None" name="stopType"/>
        <Param val="" valType="code" updates="constant" name="stopVal"/>
        <Param val="last key" valType="str" updates="constant" name="store"/>
        <Param val="False" valType="bool" updates="constant" name="storeCorrect"/>
        <Param val="True" valType="bool" updates="constant" name="syncScreenRefresh"/>
      </KeyboardComponent>
    </Routine>
    <Routine name="rest"/>
    <Routine name="image_display"/>
  </Routines>
  <Flow>
    <Routine name="exp_ctrl"/>
    <LoopInitiator loopType="TrialHandler" name="trials_2">
      <Param name="Selected rows" updates="None" val="" valType="str"/>
      <Param name="conditions" updates="None" val="None" valType="str"/>
      <Param name="conditionsFile" updates="None" val="" valType="file"/>
      <Param name="endPoints" updates="None" val="[0, 1]" valType="num"/>
      <Param name="isTrials" updates="None" val="True" valType="bool"/>
      <Param name="loopType" updates="None" val="random" valType="str"/>
      <Param name="nReps" updates="None" val="1" valType="num"/>
      <Param name="name" updates="None" val="trials_2" valType="code"/>
      <Param name="random seed" updates="None" val="" valType="code"/>
    </LoopInitiator>
    <Routine name="trial"/>
    <LoopInitiator loopType="TrialHandler" name="trials">
      <Param name="Selected rows" updates="None" val="" valType="str"/>
      <Param name="conditions" updates="None" val="None" valType="str"/>
      <Param name="conditionsFile" updates="None" val="" valType="file"/>
      <Param name="endPoints" updates="None" val="[0, 1]" valType="num"/>
      <Param name="isTrials" updates="None" val="True" valType="bool"/>
      <Param name="loopType" updates="None" val="random" valType="str"/>
      <Param name="nReps" updates="None" val="2" valType="num"/>
      <Param name="name" updates="None" val="trials" valType="code"/>
      <Param name="random seed" updates="None" val="" valType="code"/>
    </LoopInitiator>
    <Routine name="fixation"/>
    <Routine name="text_display"/>
    <Routine name="rest"/>
    <Routine name="image_display"/>
    <Routine name="makesense"/>
    <LoopTerminator name="trials"/>
    <Routine name="rest"/>
    <LoopTerminator name="trials_2"/>
  </Flow>
</PsychoPy2experiment>
