Category.delete_all

categories = [
  {
    name: 'Technoly and Creativity.',
    description: 'Artificial intelligence, Future, Programming, Cybersecurity, Data science'
  },
  {
    name: 'Entrepreneurship and Culture',
    description: 'Business, Self, Economy, Work, Productivity'
  }
]

Category.create!(categories)

posts = [
  {
    name: 'Google’s new push to AI-powered services',
    category: Category.first,
    content: '''
Google just released a whole slew of new products. Besides new phones there were updated version of their smart home hub, Google Home, and some new types of product altogether.

* We now see this shift of focus play out as it manifests in products.\n
* Here’s Google CEO Sundar Pichai at the opening of Google’s Pixel 2 event:\n

> We’re excited by the shift from a mobile-first to an AI-first world. It is not just about applying machine learning in our products, but it’s radically re-thinking how computing should work. (…) We’re really excited by this shift, and that’s why we’re here today. We’ve been working on software and hardware together because that’s the best way to drive the shifts in computing forward. But we think we’re in the unique moment in time where we can bring the unique combination of AI, and software, and hardware to bring the different perspective to solving problems for users. We’re very confident about our approach here because we’re at the forefront of driving the shifts with AI.

Google have been reframing themselves from a mobile first to an AI first company for the last year or so. (For full transparency I should add that I’ve worked with Google occasionally in the recent past, but everything discussed here is of course publicly available.)
'''
  },
  {
    name: 'The irony of the modern internet',
    category: Category.first,
    content: '''
Looking at the state of humanity in regards to its use of the internet, I cannot help but be baffled. It took me a while to understand why I felt that way, though. Today, I think I may have cracked it, or least partly cracked it. Let me try and explain.

The internet has evolved greatly over the last few decades. It started out as a collection of interconnected academic computers. Somewhere in the 1990s it started to become more mainstream. More and more people were able to connect to the internet (the “web”), but offering content was still the domain of companies. Individuals were mere consumers of the offerings of the internet.

During the 2000s, this changed. People started to run their own web servers and publish their own content. This was only accelerated by (then) new platforms like Facebook and YouTube. However, this quite quickly marked a shift in our use of the internet. In stead of running our own web servers, we put our content in centralised platforms, like Wordpress. At the moment, most “social” content is served by Facebook, Instagram (owned by Facebook), Twitter, Snapchat, and a few more. It seemed like it was a logical progression, although I’m not at all sure it was a good one.
'''
  },
  {
    name: 'Why the Oculus Go matters',
    category: Category.first,
    content: '''
Today the _Oculus Go_ was unveiled at the Oculus Connect 4. Plans for a cheap headset were stated before and it wasn’t a big deal.

The **Oculus Go** wants to be a Gear VR without a smartphone.

My first reaction back then was a bit of a letdown, interaction is really important in VR, and yet another Gear VR-like device was not that exciting to see. Google’s plans for standalone headsets with inside out tracking are a big deal, and then microsoft with the Mixed Reality headsets, LG with a Lighthouse license, and SO MANY EXCITING NEWS.
'''
  },
  {
    name: 'Computing Meets Culture',
    category: Category.first,
    content: '''
## A Machine with Two Names

Prior to the mid 20th century, the word “automata” meant a machine that was designed to operate automatically. Hero of Alexandria in the first century AD is generally credited as designing the first automata.

In the 16th century, the son of the King of Spain (Phillip II), fell down the stairs and became seriously ill. The King prayed, asking that his son be spared. The boy recovered, and the grateful King commissioned a mechanical monk (San Diego de Alcala) from Juanelo Turriano, mechanic of emperor Charles V. Jessica Riskin has written an excellent book on the subject entitled The Restless Clock.
'''
  },
  {
    name: 'It’s Time to Give Wearables the Finger',
    category: Category.first,
    content: '''
In 2013, wearables were ubiquitous; one group declared the idea of wearable technology bigger than smartphones. But now we’re entering the next phase of wearables, and what we demand from our products is different. The cool factor of just “existing” has worn off — we have to do more and do better. Wearable technology represents a massive opportunity for companies to come up with amazing ideas and products that work for us; we fall down when companies rely on what has worked in the past and depend on brand loyalty to cover the gaping hole of innovation. And it’s just unacceptable. How did we get to this point, how do we solve this issue, and what happens in this next wearables renaissance?

## Step 1(0,000): Putting tech on your body

The invention of the pedometer is an old one. Some attribute it to Jefferson, some to Da Vinci. Wearables took this old school, step-tracking technology and placed it on our skin. Products like the Nike FuelBand, Up by Jawbone and the Misfit Shine crashed onto the scene with the vague promise of better “fitness and health.” IDC predicted 19 million units shipping in 2014. The functionality was iffy at best, but the transition of technology paired directly with our bodies marked a huge transition in our culture. Tiny startups grew to be multi-billion dollar, publicly-traded companies as tech crept onto our wrists and even onto our children. All of a sudden, we went from a data-agnostic to a data-driven society.

## Hitting a plateau

But then something happened — stagnancy. The “wearable tech industry [faced] a sort of midlife crisis” as the slightly different iterations of the same technology kept churning out. The tracker you got for your mom lasted on her wrist for six months before landing in an eternal rest on the nightstand. The reason? Innovation stopped, functionality along with it. Fashion merged into the tech lane. Everyone was doing the same thing, and the bigger picture became a pool of similar wrist-worn products made of rubber. No one stepped up and pushed the boundaries further. Instead they leveraged their brand and spiffy new colors and rested on their engineering laurels. Copycats were aplenty.

## Sprinting again

Fast forward to 2017. The pulse of the wearable market is still there; people bought 33.9m units last year — up from 16.9% in 2015. But the answer to attract and keep consumers wearing your devices isn’t to put lipstick on a pig. The brave thing to do is embrace the risky part of hardware — the engineering and design — and fix it. Low adoptability means that something is not right, the product is not that comfortable to wear, be it to work out or sleep. If we’re adding devices to our body, we should be considering how people live their life and build for them, as opposed to asking people to adapt.
'''
  },
  {
    name: 'Strategy Is Not A To Do List',
    category: Category.last,
    content: '''
I had breakfast with two of my ex-students from Singapore who were building a really interesting startup. They were deep into Customer Discovery and presented a ton of customer data on the validity of their initial hypothesis: target customers, pricing, stickiness, etc.

> I was unprepared for what they said next, “We’re going to do a big launch of our product in three weeks.”

## I almost dropped my coffee.

“Wait a minute, what about the rest of Customer Development? Aren’t you going to validate your hypotheses by first getting some customers?”

Without any sense of irony they said, “Oh, our investors convinced us to skip that part, because our customer feedback was all over the map and our schedule showed us launching in three weeks and they were worried that we’d run out of cash. They told us to stay on schedule.”

Now I was confused, and I asked, “Well what do you guys believe — Customer Development or launch on a schedule?” Without missing a beat they said, “Oh, we believe both are right.

> I realized I was listening to them treat Customer Development as an item on their To Do list.
'''
  },
  {
    name: 'France — A “Startup Nation?”',
    category: Category.last,
    content: '''
With a **third of the nation’s** venture capital funding being funneled into the region and thousands of startups calling it home, Silicon Valley has caused countries around the world scrambling to reproduce the hub’s culture for their own. Today, France, a country that has long attracted intellectual innovators, hopes to do the same. Emmanuel Macron, its current president, has called for France to “be a startup nation.”

Known for its 35-hour workweek, rigid labor laws, and union **hostility** toward workplace flexibility, France has historically not been the easiest place to conduct business. However, the startup scene has begun to pick up pace in the last few years, thanks to a flourishing supply of venture capital, tech workers and a supportive ecosystem.
'''
  },
  {
    name: 'Teaching Entrepreneurship',
    category: Category.last,
    content: '''
Entrepreneurs need to be able to make **decisions quickly** — some of them difficult — execute their decisions, adjust course midstream and recognize when they stray off-course. They need to know how to seek out and apply specialized skills in math and science and communication to build an enterprise from scratch, not just maintain a part of something already built. Perhaps most importantly, they need to be able to direct and apply specialized skills that reside inside others as well. That’s leadership.

These are all the same qualities that, before the *proliferation of thousands of* academic specialties, were exactly what we wanted people to learn in college. How to think, communicate and lead. The study of entrepreneurship brings the values and discipline of a generalized education together with a world in which specialization has become essential.

The *entrepreneur* has to be able to straddle the line between generalist and specialist. That’s not needed nor even encouraged in most corporate jobs.
'''
  },
]

Post.create!(posts)


authors = [
  'Albert Einstein',
  'Charles Darwin',
  'Nicolaus Copernicus',
  'Johannes Kepler',
  'Werner Heisenberg',
  'Rober Boyle'
]

comments = [
  "Because you can't argue with all the fools in the world. It's easier to let them have their way, then trick them when they're not paying attention.",
  "To generalize is to be an idiot.",
  "Sometimes you can't see yourself clearly until you see yourself through the eyes of others",
  "All our dreams can come true if we have the courage to pursue them.",
  "It does not matter how slowly you go, so long as you do not stop.",
  "Success is walking from failure to failure with no loss of enthusiasm.",
  "Someone is sitting in the shade today because someone planted a tree a long time ago.",
  "Whenever you see a successful person, you only see the public glories, never the private sacrifices to reach them.",
  "Don't cry because it's over, smile because it happened.",
  "Success? I don't know what that word means. I'm happy. But success, that goes back to what in somebody's eyes success means. For me, success is inner peace. That's a good day for me.",
  "You only live once, but if you do it right, once is enough.",
  "Opportunities don't happen. You create them.",
  "Once you choose hope, anything's possible.",
  "Try not to become a person of success, but rather try to become a person of value.",
  "It is not the strongest of the species that survive, nor the most intelligent, but the one most responsive to change.",
  "The best and most beautiful things in the world cannot be seen or even touched -- they must be felt with the heart.",
  "Great minds discuss ideas; average minds discuss events; small minds discuss people.",
  "Live as if you were to die tomorrow. Learn as if you were to live forever.",
  "The best revenge is massive success.",
  "The difference between winning and losing is most often not quitting.",
  "When you cease to dream you cease to live.",
  "A successful man is one who can lay a firm foundation with the bricks others have thrown at him.",
  "May you live every day of your life.",
  "No one can make you feel inferior without your consent.",
  "Failure is another steppingstone to greatness.",
  "The whole secret of a successful life is to find out what is one's destiny to do, and then do it.",
  "If you're going through hell, keep going.",
  "In order to be irreplaceable one must always be different.",
  "What seems to us as bitter trials are often blessings in disguise.",
  "You miss 100 percent of the shots you don't take.",
  "The distance between insanity and genius is measured only by success.",
]


(Category.all + Post.all).each do |commentable|
  rand(3..10).times do
    commentable.comments.create(author: authors.sample, content: comments.sample)
  end
end
